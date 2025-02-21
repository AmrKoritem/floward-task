import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'entities/network_request.dart';
import 'entities/request_type.dart';
import 'entities/token_provider.dart';
import 'entities/upload_request.dart';
import 'http_overrides.dart';
import 'models/api_response.dart';
import 'parsers/json_parser.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  ApiManager._internal() {
    HttpOverrides.global = AppHttpOverrides();
    _dio = Dio();
    _dio.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          enabled: kDebugMode,
        ),
      ],
    );
  }

  final multiUploadsLimit = 5;

  late Dio _dio;

  int currentUploadIndx = 0;
  int unAuthStatus = 401;
  String baseUrl = '';
  String refreshTokenUrl = '';
  String apnsToken = '_';
  String fcmToken = '_';

  String get locale =>
      'en'; //Routes.navigatorKey.currentContext!.locale.languageCode;

  Map<String, dynamic> get baseHeaders => {
        'accept': 'application/json',
        'Accept-Language': locale,
        'apns-token': apnsToken,
        'fcm-token': fcmToken,
      };
  TokenProvider? tokensProvider;

  Map<String, String> _getReqTokenHeader({bool isRefresh = false}) {
    final token = isRefresh
        ? tokensProvider?.getRefreshToken()
        : tokensProvider?.getAccessToken();
    return token != null
        ? {
            'Authorization': 'Bearer $token',
          }
        : {};
  }

  Future<Response<ApiResponse<T>>?> handleReAuth<T>({
    required String url,
    dynamic parameters,
    required RequestType type,
    required Map<String, dynamic>? headers,
  }) async {
    // rebuild when you get unauthorized status code
    final res = await _requestAndParse<Map<String, dynamic>>(
      url: refreshTokenUrl,
      type: RequestType.post,
      headers: {
        ..._getReqTokenHeader(isRefresh: true),
      },
    );

    final token = res.data?.data?['data']['token'];
    final accessToken = token['access_token'];
    final refreshToken = token['refresh_token'];

    if (accessToken == null || refreshToken == null) {
      tokensProvider?.setAccessToken('');
      tokensProvider?.setRefreshToken('');
      return null;
    }

    tokensProvider?.setAccessToken(accessToken.toString());
    tokensProvider?.setRefreshToken(refreshToken.toString());

    return await _requestAndParse<T>(
      url: url,
      parameters: parameters,
      type: type,
      headers: headers,
    );
  }

  Future<ApiResponse<List<T>>?> upload<T>({
    required UploadRequest request,
  }) async {
    ApiResponse<List<T>>? result;
    var uploadingIndex = 0;
    currentUploadIndx = uploadingIndex;
    // TODO: multi-threading
    while (uploadingIndex < request.uploadedFiles.length) {
      for (var i = 0;
          i < multiUploadsLimit && i < request.uploadedFiles.length;
          i++) {
        final formData = await request.makeFormData(uploadingIndex);
        final res = await _requestAndParse<T>(
          url: request.url,
          parameters: formData,
          type: RequestType.post,
          headers: {
            ...(request.headers ?? {}),
            'Content-Type': 'multipart/form-data',
          },
        );
        uploadingIndex += 1;
        currentUploadIndx = uploadingIndex;
        final responseData = res.data;
        if (responseData == null) continue;
        final data = responseData.data;
        if (data == null) continue;
        result ??= ApiResponse<List<T>>(
          status: responseData.status,
          statusCode: responseData.statusCode,
          message: responseData.message,
          data: [],
          error: responseData.error,
          errorType: responseData.errorType,
        );
        result.data?.add(data);
      }
    }
    currentUploadIndx = 0;
    return result;
  }

  Future<ApiResponse<T>> request<T>({
    required NetworkRequest request,
  }) async {
    final reqParam = request.parameters;
    reqParam?.removeWhere((key, value) => value == null);
    final parameters = request.type == RequestType.get
        ? reqParam
        : json.encode(request.parameters);
    final res = await _requestAndParse<T>(
      url: request.url,
      parameters: parameters,
      type: request.type,
      headers: request.headers,
    );
    res.data = res.data?.copyWith(statusCode: res.statusCode);
    return res.data ?? ApiResponse();
  }

  Future<Response<ApiResponse<T>>> _requestAndParse<T>({
    required String url,
    dynamic parameters,
    required RequestType type,
    required Map<String, dynamic>? headers,
  }) async {
    final newUrl =
        '${url.contains('https://') || url.contains('http://') ? '' : baseUrl}$url';
    final Map<String, dynamic> reqHeaders = {
      ...baseHeaders,
      ...(headers ?? {}),
    };
    if (!reqHeaders.keys.contains('Authorization')) {
      reqHeaders.addAll(_getReqTokenHeader());
    }

    try {
      final response = await _request(
        url: newUrl,
        parameters: parameters,
        type: type,
        headers: reqHeaders,
      );

      var data = response.data is List
          ? {'data': response.data}
          : (response.data ?? {});
      if (!(data as Map<String, dynamic>).keys.contains('data')) {
        data = {'data': response.data};
      }
      final apiRes = ApiResponse<T>.fromJson(data, (json) {
        assert(JsonParser.getParser<T>() != null,
            'Please add $T fromJson to JsonParser class');
        final jsonMap =
            json is List ? {'data': json} : (json as Map<String, dynamic>);
        final parsed = JsonParser.parse<T>(jsonMap);
        return parsed!;
      });
      return Response<ApiResponse<T>>(
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusMessage: response.statusMessage,
        data: apiRes.copyWith(statusCode: response.statusCode),
      );
    } on DioException catch (error) {
      debugPrint('🔴 $type url: $newUrl -> error - DioException: $error');
      debugPrint('🔴 ... - response: ${error.response?.data}');
      debugPrint('🔴 ... - error: ${error.error}');
      debugPrint('🔴 ... - message: ${error.message}');
      final statusCode = error.response?.statusCode ?? -1;
      if (statusCode == unAuthStatus && !url.contains(refreshTokenUrl)) {
        final res = await handleReAuth<T>(
          url: url,
          parameters: parameters,
          type: type,
          headers: headers,
        );
        if (res != null) return res;
      }
      final dataMap = error.response?.data is Map ? error.response?.data : null;
      final eror = dataMap?['errors'] is List
          ? {'error': dataMap?['errors']}
          : dataMap?['errors'];
      final errorRes = Response<ApiResponse<T>>(
        requestOptions: error.requestOptions,
        statusCode: statusCode,
        data: ApiResponse(
          statusCode: statusCode,
          errorType: error.type,
          data: null,
          message: dataMap?['message'],
          error: eror,
        ),
      );
      return errorRes;
    } catch (error) {
      debugPrint('🔴 $type url: $newUrl -> error: $error');
      final unknownErrorRes = Response<ApiResponse<T>>(
        requestOptions: RequestOptions(),
        statusCode: -1,
        data: null,
      );
      return unknownErrorRes;
    }
  }

  Future<Response<dynamic>> _request({
    required String url,
    required dynamic parameters,
    required RequestType type,
    required Map<String, dynamic>? headers,
  }) async {
    switch (type) {
      case RequestType.post:
        return _dio.post(url,
            data: parameters, options: Options(headers: headers));
      case RequestType.patch:
        return _dio.patch(url,
            data: parameters, options: Options(headers: headers));
      case RequestType.delete:
        return _dio.delete(url,
            data: parameters, options: Options(headers: headers));
      case RequestType.put:
        return _dio.put(url,
            data: parameters, options: Options(headers: headers));
      case RequestType.get:
        return _dio.get(url,
            options: Options(headers: headers), queryParameters: parameters);
    }
  }
}

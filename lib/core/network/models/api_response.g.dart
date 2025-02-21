// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseImpl<T>(
      status: json['status'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      error: json['error'] as Map<String, dynamic>?,
      errorType:
          $enumDecodeNullable(_$DioExceptionTypeEnumMap, json['errorType']),
    );

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'error': instance.error,
      'errorType': _$DioExceptionTypeEnumMap[instance.errorType],
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

const _$DioExceptionTypeEnumMap = {
  DioExceptionType.connectionTimeout: 'connectionTimeout',
  DioExceptionType.sendTimeout: 'sendTimeout',
  DioExceptionType.receiveTimeout: 'receiveTimeout',
  DioExceptionType.badCertificate: 'badCertificate',
  DioExceptionType.badResponse: 'badResponse',
  DioExceptionType.cancel: 'cancel',
  DioExceptionType.connectionError: 'connectionError',
  DioExceptionType.unknown: 'unknown',
};

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({
    bool? status,
    int? statusCode,
    String? message,
    T? data,
    Map<String, dynamic>? error,
    DioExceptionType? errorType,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(
          Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

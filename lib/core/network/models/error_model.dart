import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_response.dart';

part 'error_model.freezed.dart';

@unfreezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    required int statusCode,
    ApiResponse<void>? responseBody,
  }) = _ErrorModel;
}

extension QuickError on ErrorModel {
  static ErrorModel withMessage(String errorMessage) {
    return ErrorModel(
      statusCode: -1,
      responseBody: ApiResponse(
        status: false,
        message: errorMessage,
      ),
    );
  }
}

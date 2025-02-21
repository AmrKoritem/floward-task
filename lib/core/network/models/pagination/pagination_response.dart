import 'package:freezed_annotation/freezed_annotation.dart';

import 'payload_model.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationResponse<T> with _$PaginationResponse<T> {
  factory PaginationResponse({
    List<T>? items,
    PayloadModel? payload,
  }) = _PaginationResponse;

  factory PaginationResponse.fromJson(
          Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);
}

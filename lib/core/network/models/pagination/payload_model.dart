import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_model.dart';

part 'payload_model.freezed.dart';
part 'payload_model.g.dart';

@unfreezed
class PayloadModel with _$PayloadModel {
  factory PayloadModel({
    PaginationModel? pagination,
  }) = _PayloadModel;

  factory PayloadModel.fromJson(Map<String, Object?> json) =>
      _$PayloadModelFromJson(json);
}

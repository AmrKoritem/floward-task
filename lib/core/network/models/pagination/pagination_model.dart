import 'package:freezed_annotation/freezed_annotation.dart';

import 'link_model.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@unfreezed
class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    int? total,
    int? page,
    int? from,
    int? to,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'items_per_page') int? itemsPerPage,
    @JsonKey(name: 'first_page_url') String? firstPageUrl,
    @JsonKey(name: 'next_page_url') String? nextPageUrl,
    @JsonKey(name: 'prev_page_url') String? prevPageUrl,
    List<LinkModel>? links,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, Object?> json) =>
      _$PaginationModelFromJson(json);
}

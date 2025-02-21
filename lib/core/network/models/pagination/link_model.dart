import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@unfreezed
class LinkModel with _$LinkModel {
  factory LinkModel({
    String? url,
    String? label,
    bool? active,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, Object?> json) =>
      _$LinkModelFromJson(json);
}

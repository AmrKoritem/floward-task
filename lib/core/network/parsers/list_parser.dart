class ListParser<T> {
  T Function(Map<String, dynamic>) itemFromJson;
  Map<String, dynamic> Function(T) itemToJson;

  ListParser({
    required this.itemFromJson,
    required this.itemToJson,
  });

  List<T> fromJson(Map<String, Object?> json) {
    var objects = <T>[];
    if (json.values.firstOrNull != null) {
      (json.values.first as List<dynamic>?)?.forEach((v) {
        objects.add(itemFromJson(v));
      });
    }
    return objects;
  }

  Map<String, Object?> toJson(List<T> list) {
    return {'data': list.map((e) => itemToJson(e)).toList()};
  }
}

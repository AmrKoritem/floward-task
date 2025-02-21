class IntToBoolParser {
  String key;

  IntToBoolParser({required this.key});

  bool? fromJson(Map<String, Object?> json) {
    final number = json[key] as num?;
    final numb = number?.toInt() ?? 0;
    return numb > 0;
  }

  Map<String, Object?> toJson(bool? variable) {
    return {key: variable == true ? 1 : 0};
  }
}

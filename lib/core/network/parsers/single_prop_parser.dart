class SinglePropParser<T> {
  String key;

  SinglePropParser({required this.key});

  T? fromJson(Map<String, Object?> json) => json[key] as T?;

  Map<String, Object?> toJson(T? variable) => {key: variable};
}

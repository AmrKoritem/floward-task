import '../../../data/models/weather_data_model.dart';
import './list_parser.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class JsonParser {
  static final Map<Type, FromJson> _parsers = {
    Map<String, Object?>: (json) => json,
    Map<String, dynamic>: (json) => json,
    WeatherDataModel: WeatherDataModel.fromJson,
  };

  static void addParser<T extends Type>({
    required T type,
    required FromJson fromJson,
    bool andList = false,
  }) {
    _parsers[type] = fromJson;
    if (andList) {
      _parsers[List<T>] = ListParser(
        itemFromJson: fromJson,
        itemToJson: (_) => {},
      ).fromJson;
    }
  }

  static T? parse<T>(Map<String, Object?> json) {
    return _parsers[T]?.call(json);
  }

  static FromJson<T>? getParser<T>() {
    return _parsers[T] as FromJson<T>?;
  }
}

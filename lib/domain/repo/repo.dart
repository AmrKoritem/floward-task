import 'package:dartz/dartz.dart';

import '../../core/network/models/error_model.dart';
import '../entities/weather_data.dart';

abstract class Repo {
  Future<Either<WeatherData, ErrorModel?>> fetchWeatherData();
}

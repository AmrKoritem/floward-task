import 'package:dartz/dartz.dart';

import '../../core/network/models/error_model.dart';
import '../../domain/entities/weather_data.dart';
import '../../domain/repo/repo.dart';
import '../datasources/weather_datasource.dart';

class RepoImp implements Repo {
  final WeatherDatasource _datasource;

  RepoImp({
    WeatherDatasource? datasource,
  }) : _datasource = datasource ?? WeatherDatasourceImp();

  @override
  Future<Either<WeatherData, ErrorModel?>> fetchWeatherData() async {
    final response = await _datasource.fetchWeatherData();
    return response.fold((l) => Left(l as WeatherData), (r) => Right(r));
  }
}

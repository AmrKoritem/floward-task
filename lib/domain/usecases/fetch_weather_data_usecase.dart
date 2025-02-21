import 'package:dartz/dartz.dart';

import '../../core/network/models/error_model.dart';
import '../../data/repo/repo_imp.dart';
import '../entities/weather_data.dart';
import '../repo/repo.dart';

class FetchWeatherDataUsecase {
  final Repo _repository;

  FetchWeatherDataUsecase({Repo? repository})
      : _repository = repository ?? RepoImp();

  Future<Either<WeatherData, ErrorModel?>> call(String city) async {
    final result = await _repository.fetchWeatherData(city);
    return result.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }
}

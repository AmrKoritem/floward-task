import 'package:dartz/dartz.dart';

import '../../core/network/api_manager.dart';
import '../../core/network/entities/network_request.dart';
import '../../core/network/entities/request_type.dart';
import '../../core/network/models/error_model.dart';
import '../models/weather_data_model.dart';

abstract class WeatherDatasource {
  Future<Either<WeatherDataModel, ErrorModel?>> fetchWeatherData();
}

class WeatherDatasourceImp implements WeatherDatasource {
  final api = ApiManager();

  WeatherDatasourceImp();

  @override
  Future<Either<WeatherDataModel, ErrorModel?>> fetchWeatherData() async {
    final response = await api.request<WeatherDataModel>(
        request: NetworkRequest(
      url:
          'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}', // TODO:
      type: RequestType.post,
    ));
    final apiResp = response.data;
    final status = response.statusCode ?? -1;
    if (status < 200 || status > 299 || apiResp == null) {
      return Right(ErrorModel(responseBody: response, statusCode: status));
    }
    return Left(apiResp);
  }
}

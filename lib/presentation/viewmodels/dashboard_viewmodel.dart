import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/base/base_state.dart';
import '../../domain/entities/weather_data.dart';
import '../../domain/usecases/fetch_weather_data_usecase.dart';

final dashboardViewmodel =
    StateNotifierProvider<DashboardViewmodel, BaseState<WeatherData?>>(
        (ref) => DashboardViewmodel());

class DashboardViewmodel extends StateNotifier<BaseState<WeatherData?>> {
  final FetchWeatherDataUsecase _fetchWeatherDataUsecase;

  DashboardViewmodel({FetchWeatherDataUsecase? fetchWeatherDataUsecase})
      : _fetchWeatherDataUsecase =
            fetchWeatherDataUsecase ?? FetchWeatherDataUsecase(),
        super(BaseState(data: null));

  Future<void> fetchWeatherData() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final result = await _fetchWeatherDataUsecase.call();
    return result.fold(
      (data) {
        state = state.copyWith(isLoading: false, data: data);
      },
      (error) {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}

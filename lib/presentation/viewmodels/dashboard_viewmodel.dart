import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/base/base_state.dart';
import '../../domain/entities/weather_data.dart';
import '../../domain/usecases/fetch_weather_data_usecase.dart';

final dashboardViewmodel =
    StateNotifierProvider<DashboardViewmodel, BaseState<DashboardState?>>(
        (ref) => DashboardViewmodel());

class DashboardState {
  String? name;
  String? email;
  String? imageName;
  WeatherData? data;

  DashboardState({
    this.data,
    this.email,
    this.name,
    this.imageName,
  });

  DashboardState copyWith({
    String? name,
    String? email,
    String? imageName,
    WeatherData? data,
  }) {
    return DashboardState(
      data: data ?? this.data,
      email: email ?? this.email,
      name: name ?? this.name,
      imageName: imageName ?? this.imageName,
    );
  }
}

class DashboardViewmodel extends StateNotifier<BaseState<DashboardState?>> {
  final FetchWeatherDataUsecase _fetchWeatherDataUsecase;

  DashboardViewmodel({FetchWeatherDataUsecase? fetchWeatherDataUsecase})
      : _fetchWeatherDataUsecase =
            fetchWeatherDataUsecase ?? FetchWeatherDataUsecase(),
        super(BaseState(data: DashboardState()));

  Future<void> fetchWeatherData(String city) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final result = await _fetchWeatherDataUsecase.call(city);
    return result.fold(
      (data) {
        state = state.copyWith(
          isLoading: false,
          data: state.data?.copyWith(data: data),
        );
      },
      (error) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void setProfile(
    String? name,
    String? email,
    String? imageName,
  ) {
    state = state.copyWith(
      data:
          state.data?.copyWith(name: name, email: email, imageName: imageName),
    );
  }
}

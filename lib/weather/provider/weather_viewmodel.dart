import 'package:flutter_training/models/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_viewmodel.g.dart';

@riverpod
final class WeatherViewModel extends _$WeatherViewModel {
  @override
  WeatherModel build() => WeatherModel(weather: '');

  void fetchWeather() {
    final yumemiWeather = YumemiWeather();
    final weatherCondition = yumemiWeather.fetchSimpleWeather();
    state = WeatherModel(weather: weatherCondition);
  }
}

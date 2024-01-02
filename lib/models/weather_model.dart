import 'package:flutter_training/enums/weather.dart';

class WeatherModel {
  final String _weather;
  weather get weatherCondition => switch (_weather) {
        'sunny' => weather.sunny,
        'cloudy' => weather.cloudy,
        'rainy' => weather.rainy,
        _ => weather.unknown,
      };
  String get svgIconPath => switch (weatherCondition) {
        weather.sunny => 'assets/images/sunny.svg',
        weather.cloudy => 'assets/images/cloudy.svg',
        weather.rainy => 'assets/images/rainy.svg',
        _ => '',
      };

  WeatherModel({required weather}) : _weather = weather;
}

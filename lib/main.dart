import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/weather/view/weather_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProviderScope(child: const WeatherView()),
    ),
  );
}

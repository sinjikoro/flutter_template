import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/home.dart';
import 'package:flutter_training/weather/view/weather_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/weather': (context) => const WeatherView(),
        },
      ),
    ),
  );
}

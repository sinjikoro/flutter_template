import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/weather/provider/weather_viewmodel.dart';
import 'package:flutter_training/weather/view/widgets/weather_disp_area.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Center(
            child: WeatherDispArea(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeatherTextButton(
                        label: 'close', onPressed: () => SystemNavigator.pop()),
                    WeatherTextButton(
                      label: 'reload',
                      onPressed: () => ref
                          .read(weatherViewModelProvider.notifier)
                          .fetchWeather(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// テキストボタン
/// リロード、閉じるで利用
class WeatherTextButton extends StatelessWidget {
  const WeatherTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textWidth = deviceWidth * 0.25;

    return SizedBox(
      width: textWidth,
      child: TextButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

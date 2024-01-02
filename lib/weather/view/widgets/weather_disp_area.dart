import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/weather/provider/weather_viewmodel.dart';

/// 温度表示エリア
class WeatherDispArea extends StatelessWidget {
  const WeatherDispArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _WeatherIcon(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TempText(tempType: _TempType.min),
            _TempText(tempType: _TempType.max),
          ],
        ),
      ],
    );
  }
}

/// 中央に配置するアイコンWidget
class _WeatherIcon extends ConsumerWidget {
  const _WeatherIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final edgeLength = deviceWidth * 0.5;
    final iconSourcePath = ref.watch(weatherViewModelProvider).svgIconPath;

    return SizedBox(
      width: edgeLength,
      child: AspectRatio(
        aspectRatio: 1,
        child: iconSourcePath.isNotEmpty
            ? SvgPicture.asset(iconSourcePath)
            : Placeholder(),
      ),
    );
  }
}

/// 最高/最低温度
enum _TempType { min, max }

/// 温度表示
class _TempText extends StatelessWidget {
  const _TempText({
    required this.tempType,
  });

  final _TempType tempType;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textWidth = deviceWidth * 0.25;
    final style = Theme.of(context).textTheme.labelLarge;

    return SizedBox(
      width: textWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          '** ℃',
          textAlign: TextAlign.center,
          style: style!.copyWith(
              color: tempType == _TempType.min ? Colors.blue : Colors.red),
        ),
      ),
    );
  }
}

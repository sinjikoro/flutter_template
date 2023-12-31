import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Center(
              child: Column(
                children: [
                  MainIcon(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TempText(tempType: TempType.min),
                      TempText(tempType: TempType.max),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CloseText(),
                      ReloadText(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 中央に配置するアイコンWidget
class MainIcon extends StatelessWidget {
  const MainIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final edgeLength = deviceWidth * 0.5;

    return SizedBox(
      width: edgeLength,
      child: AspectRatio(
        aspectRatio: 1,
        child: Placeholder(),
      ),
    );
  }
}

enum TempType { min, max }

/// 温度表示
class TempText extends StatelessWidget {
  const TempText({
    super.key,
    required this.tempType,
  });

  final TempType tempType;

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
              color: tempType == TempType.min ? Colors.blue : Colors.red),
        ),
      ),
    );
  }
}

/// リロードボタン
class ReloadText extends StatelessWidget {
  const ReloadText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textWidth = deviceWidth * 0.25;

    return SizedBox(
      width: textWidth,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'reload',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

/// 閉じるボタン
class CloseText extends StatelessWidget {
  const CloseText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final textWidth = deviceWidth * 0.25;

    return SizedBox(
      width: textWidth,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'close',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

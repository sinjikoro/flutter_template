import 'package:flutter/material.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) async => ViewLoaded());
  }

  void ViewLoaded();
}

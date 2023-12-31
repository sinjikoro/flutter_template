import 'package:flutter/material.dart';
import 'package:flutter_training/cores/mixins/state_mixin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with StateMixin {
  @override
  void ViewLoaded() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.pushReplacementNamed(context, '/weather');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.green));
  }
}

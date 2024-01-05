import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) async {
      await Future.delayed(const Duration(microseconds: 500));
      Navigator.pushNamed(context, '/weather');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.green));
  }
}

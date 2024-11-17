import 'package:flutter/material.dart';
import 'screen/temperature.dart';
import 'screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcome = true;
  Widget get screen => isWelcome
      ? Welcome(
          onPressed: changeScreen,
        )
      : Temperature();

  void changeScreen() {
    setState(() {
      isWelcome = !isWelcome;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}

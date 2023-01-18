import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List App',
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fast_money/Pages/home.dart';
import 'package:fast_money/Pages/operation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/spending': (context) => SpentScreen()
      }
    );
  }
}


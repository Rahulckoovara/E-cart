import 'package:e_cart/screens/front.dart';
import 'package:e_cart/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
              .copyWith(secondary: Colors.white),
          useMaterial3: true),
      home: Front(),
    );
  }
}

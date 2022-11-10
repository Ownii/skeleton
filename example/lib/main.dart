import 'package:example/example_screen.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: [
          SkeletonStyle(color: const Color(0xFF37474F)),
        ],
      ),
      home: Scaffold(
        body: ExampleScreen(),
      ),
    );
  }
}

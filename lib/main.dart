import 'package:flutter/material.dart';
import 'package:untitled/main_screen.dart';
import 'package:untitled/material_white.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'Schyler'
      ),
      home: MainScreen(),
    );
  }
}


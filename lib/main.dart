import 'package:flutter/material.dart';
import 'UI/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: new ThemeData(scaffoldBackgroundColor: const Color(0xF2D492)),
      home: MyHomePage(),
    );
  }
}

import 'package:cropapp/UI/ViewAll.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: new ThemeData(scaffoldBackgroundColor: background),
      debugShowCheckedModeBanner: false,
      home: new viewAll(),
    );
  }
}

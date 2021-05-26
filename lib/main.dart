import 'package:cropapp/Pages/addVolunteer.dart';
import 'package:cropapp/Pages/citizenPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddVolunteer(),
    );
  }
}

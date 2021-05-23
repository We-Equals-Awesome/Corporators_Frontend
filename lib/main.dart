import 'package:cropapp/UI/VolunteerViewAll.dart';
import 'package:flutter/material.dart';
import 'UI/viewAllCitizen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new volunteerList(),
    );
  }
}

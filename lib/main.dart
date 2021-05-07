import 'package:cropapp/UI/ViewAll.dart';
import 'UI/ComplaintsScroll.dart';
import 'UI/WallFeedScroll.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new viewAll(),
    );
  }
}

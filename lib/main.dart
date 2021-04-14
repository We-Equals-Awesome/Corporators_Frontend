import 'package:flutter/material.dart';

import 'UI/DataEntry.dart';


//import 'UI/HomePage.dart';
//import 'Utils/color.dart';
//import 'UI/pageextra.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: new ThemeData(scaffoldBackgroundColor: background),
      debugShowCheckedModeBanner: false,
      home: new dataEntry(),
    );
  }
}

import 'package:Corporator_Mobile_App/Utils/Navigation_Bar.dart';
import 'package:flutter/material.dart';

import 'Screens/User/Home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigation_Bar());
  }
}

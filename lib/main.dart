//import 'package:cropapp/UI/citizenPage.dart';
import 'package:cropapp/Screens/Complaints/complaint_page_2.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import 'Screens/Admin/wall_feed_new.dart';
import 'Screens/Admin/wall_feed_updated.dart';

//import 'Screens/Navigation_Bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: WallFeedUpdated(), //LoginPage1(0),
    );
  }
}

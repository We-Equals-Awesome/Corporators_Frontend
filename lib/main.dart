//import 'package:cropapp/UI/citizenPage.dart';
import 'package:flutter/material.dart';
import 'Screens/login_and_signup/login_page1.dart';
//import 'Screens/Navigation_Bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      /*
       *  Value 0 is passed to MyhomePage.
       *  This value is used to decide whether or not to show the ALterDialogue box in login page.
       *  When the user opens the app then the AlterDialogue is not shown
       *  When the user is redirected to the Login page from the 'EnterYourDetailsPage',
       *   then the AlterDialogue Box is  shown.
      */
      home: LoginPage1(0), //LoginPage1(0),
    );
  }
}

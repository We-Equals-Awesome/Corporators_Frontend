import 'package:flutter/material.dart';
import 'UI/login_page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*  Value 0 is passed to MyhomePage.
       *  This value is to decide whether or not to show the ALterDialogue box in login page.
       *  When the user opens the app then the AlterDialogue is not shown
       *  When the user is redirected to the Login page from the 'EnterYourDetailsPage',
         then the AlterDialogue Box is  shown.*/
      home: MyHomePage(0),
    );
  }
}

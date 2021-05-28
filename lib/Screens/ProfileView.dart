import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';

class Profile_View extends StatefulWidget {
  Profile_View({Key key}) : super(key: key);

  @override
  _Profile_ViewState createState() => _Profile_ViewState();
}

class _Profile_ViewState extends State<Profile_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(child: Text('You are in Profile Page')),
    );
  }
}

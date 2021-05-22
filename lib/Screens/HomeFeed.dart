import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';

class Complaint_View extends StatefulWidget {
  Complaint_View({Key key}) : super(key: key);

  @override
  _Complaint_ViewState createState() => _Complaint_ViewState();
}

class _Complaint_ViewState extends State<Complaint_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(child: Text('You are in Complaints Page')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/Admin-complaint.dart';

class AdminComplaintAllot extends StatefulWidget {
  final AdminComplaint adminComplaint;
  AdminComplaintAllot({this.adminComplaint});

  @override
  _AdminComplaintAllotState createState() => _AdminComplaintAllotState();
}

class _AdminComplaintAllotState extends State<AdminComplaintAllot> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    widget.adminComplaint.time,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

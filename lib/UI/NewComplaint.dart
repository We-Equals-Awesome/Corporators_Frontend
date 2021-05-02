import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:newsfeed_screen/UI/admin-complaintView.dart';

class NewComplaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            child: Center(
              child: Text(
                "Add new Complaint",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Container(
            child: Text(
              "Tap Button to go Admin complain view page",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminComplaintview(),
              //builder: (context) => ReadFeeds(news: trending),
            ),
          );
        },
        elevation: 2,
        backgroundColor: submitGrey,
        //icon: Icon(Icons.edit),
        label: Text(
          'Admin-ComplaintView page',
          style: TextStyle(color: background, fontFamily: 'ProductSans'),
        ),
      ),
    );
  }
}

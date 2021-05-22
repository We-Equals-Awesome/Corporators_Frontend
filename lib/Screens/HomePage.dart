import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(child: Text('You are in Home Page')),
    );
  }
}

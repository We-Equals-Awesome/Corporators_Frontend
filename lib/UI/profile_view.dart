import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(child: Text('Profile view')),
    );
  }
}

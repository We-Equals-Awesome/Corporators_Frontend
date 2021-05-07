import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

class CitizenPage extends StatefulWidget {
  @override
  _CitizenPageState createState() => _CitizenPageState();
}

class _CitizenPageState extends State<CitizenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 50,
              ),
              _textForm("naanu", context),
              _textForm("neenu", context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _textForm(String a, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        decoration: BoxDecoration(
          color: textBoxBack,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              a,
            ),
          ),
        ),
      ),
    );
  }
}

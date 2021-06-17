import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CitizenPage extends StatefulWidget {
  @override
  _CitizenPageState createState() => _CitizenPageState();
}

List details = [
  '9876543210',
  'abc@test.com',
  '20/05/1944',
  'ABC12345',
  '123456789023'
];

class _CitizenPageState extends State<CitizenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CircleAvatar(
                  backgroundColor: textBoxBack,
                  radius: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This is the name',
                  style: TextStyle(
                    fontSize: 28,
                    color: text,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textForm("Phone Number", details[0], context),
                  _textForm("Email", details[1], context),
                  _textForm("Date of Birth", details[2], context),
                  _textForm("Voter ID", details[3], context),
                  _textForm("Aadhar Number", details[4], context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textForm(String a, String b, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 8, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                a,
                style: TextStyle(
                  color: text,
                  fontFamily: "ProductSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Container(
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
                  b,
                  style: TextStyle(
                    color: text,
                    fontFamily: "ProductSans",
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

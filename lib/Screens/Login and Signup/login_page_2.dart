import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/color.dart';

import '../Home_Page.dart';
import 'Registration_1.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  var OTP;
  //formkey is used for form that takes phone number and OTP
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //function that returns the textformfields
  Widget txtformfield(String s, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          cursorColor: hintText,
          keyboardType: TextInputType.phone,
          validator: (String value) {
            if (value.isEmpty) {
              return 'OTP is required';
            }
            return null;
          },
          onSaved: (String value) {
            OTP = value;
          },
          decoration: new InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 100),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            filled: true,
            labelStyle:
                new TextStyle(color: hintText, fontFamily: 'ProductSans'),
            labelText: 'OTP',
            fillColor: textBoxBack,
          ),
        ));
  }

//widget that returns a button
  Widget button(String s, BuildContext context) {
    return ElevatedButton(
      onPressed: s == 'Login'
          ? () {
              //when login button clicked, the formstate is saved if valid
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeFeed()));
            }
          : () {
              //open CreateAccountPage when Create button pressed
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage1()));
            },
      child: Text(s == 'Login' ? 'Login' : 'Create',
          style: TextStyle(
              color: navIcon, fontFamily: 'ProductSans', fontSize: 12)),
      style: ElevatedButton.styleFrom(
          primary: submitGrey,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12,
              vertical: MediaQuery.of(context).size.height * 0.01),
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            fontWeight: FontWeight.bold,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
                      //container to store the circular logo
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/icons/logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      //text for the app name
                      Center(
                        child: Text(
                          'App Something',
                          style: TextStyle(
                              color: text,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045),
                      txtformfield('OTP', context),
                      //container that has a textformfield to store OTP
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      //elevated button Login
                      button('Login', context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14),
                      Container(
                        child: Text(
                          'Are you a citizen of this ward? Create Account',
                          style: TextStyle(
                              color: text,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //elevated button 'Create'CreateAccount
                      button('Create', context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

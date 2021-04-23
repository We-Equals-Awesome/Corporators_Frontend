import 'package:flutter/material.dart';
import 'register_page1.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:cropapp/UI/news_feed1.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  var OTP;
  //formkey is used for form that takes phone number and OTP
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //isHidden stores the visibility of OTP
  bool _isHidden = true;
  //method to toggle the visibility of OTP
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden; //changes the visibility by negating it
    });
  }

  //function that returns the textformfields
  Widget txtformfield(String s, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
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
          obscureText: _isHidden,
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
                  new TextStyle(color: hintText, fontFamily: 'product-sans'),
              labelText: 'OTP',
              fillColor: textBoxBack,
              suffixIcon: IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(
                        Icons.visibility_off,
                        color: hintText,
                      )
                    : Icon(
                        Icons.visibility,
                        color: hintText,
                      ),
              )),
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
                  .push(MaterialPageRoute(builder: (context) => NewsFeed()));
            }
          : () {
              //open CreateAccountPage when Create button pressed
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage1()));
            },
      child: Text(s == 'Login' ? 'Login' : 'Create',
          style: TextStyle(color: navIcon, fontFamily: 'product-sans')),
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
                              image: AssetImage('Assets/assets/logo.jpg'),
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
                                  MediaQuery.of(context).size.height * 0.035,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'product-sans'),
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
                              fontFamily: 'product-sans'),
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

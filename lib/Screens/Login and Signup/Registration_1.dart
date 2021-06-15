import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:Corporator_Mobile_App/Utils/color.dart';

import 'Registration_2.dart';
import 'Registration_3.dart';

//class to store info about users
class MyData {
  var firstName = '';
  var lastName = '';
  var phoneNumber = '';
  var email = '';
  var dob = '';
  var aadharNumber = '';
  var voterId = '';
}

//create account page
class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController con;
  DateTime selectedDate =
      DateTime.now(); //stores the value of selectedDate in android
  DateTime _currentdate = DateTime.now(); //for iOS
  final TextEditingController dateCon =
      new TextEditingController(); //dateField controller
  int currStep = 0; //set the initial step to 0
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData(); //create a new class of type Mydata
//function that returns alter box if the user does not belong to the ward
  Future<void> OpenAlter() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(70.0))),
            backgroundColor: textBoxBack,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'It seems like you are not part of this ward.\n\nContact your ward incharge',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                          color: text),
                    ),
                  ),
                  SizedBox(height: 10),
                  //continue button to save the form and move to next page
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            //open Enter your details page when Continue button pressed
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterPage3()));
                          },
                          child: Row(children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(
                                  color: navIcon, fontFamily: 'ProductSans'),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: navIcon,
                            )
                          ]),
                          style: ElevatedButton.styleFrom(
                              primary: submitGrey,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.06,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ProductSans'),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              )),
                        ), // button 1
                      ])
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    dateCon.text = (Platform.isAndroid)
        ? "${selectedDate.toLocal()}".split(' ')[0]
        : DateFormat.yMMMd().format(_currentdate);
    //function to show snack bar if all the fields are not filled
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    //method that returns the selected date from the calender
    _selectDate(BuildContext context) async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light(),
              child: child,
            );
          });
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    void _iosSelectDate(BuildContext context) {
      showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext) {
            return Container(
                height: MediaQuery.of(context).copyWith().size.height * 0.25,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        _currentdate = newDate;
                      });
                    },
                    minimumYear: 1900,
                    maximumYear: 2050,
                    mode: CupertinoDatePickerMode.date));
          });
    }

    //function that returns a texteformfield
    Widget txtformfield(String s, BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          autofocus: (s == 'First Name') ? true : false,
          controller: con,
          keyboardType: (s == 'Phone Number' || s == 'Aadhar Number')
              ? TextInputType.phone
              : TextInputType.text,
          autocorrect: false,
          onSaved: (value) {
            if (s == 'First Name')
              data.firstName = value;
            else if (s == 'Last Name')
              data.lastName = value;
            else if (s == 'Phone Number')
              data.phoneNumber = value;
            else if (s == 'Email Id')
              data.email = value;
            else if (s == 'Voter Id')
              data.voterId = value;
            else if (s == 'Aadhar Number')
              data.aadharNumber = value;
            else if (s == 'Last Name') data.lastName = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return s + ' is required.';
            } else if (s == 'Email Id' &&
                !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
              return 'Please a valid Email';
            } else
              return null;
          },
          decoration: new InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            fillColor: textBoxBack,
            filled: true,
            labelText: s,
            labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 100),
            ),
          ),
        ),
      );
    }

    //textbox function returns the text with the required styling
    Widget textbox(String a, BuildContext context) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            a,
            style: TextStyle(
                fontSize: a == 'Create Account' ? 25 : 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans',
                color: text),
          ),
        ),
      );
    }

    //method that saves the current state of the form
    void _submitDetails() {
      final FormState formState = _formKey.currentState;
      //message to enter correct data if the validation returns false
      if (!formState.validate()) {
        showSnackBarMessage('Please fill all fields');
      } else {
        //show alter box if voter id doesnt below to the ward
        if (data.voterId == '1') {
          print('Voter id 1');
          OpenAlter();
        } else {
          //save current form state if validation returns true
          formState.save();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterPage2()));
        }
      }
    }

    return Scaffold(
      backgroundColor: background,
      //body is a container with child as a form that has the textfields
      body: new Container(
          child: new Form(
        key: _formKey,
        //textfields are wrapped in a list view
        child: new ListView(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          textbox('Create Account', context),
          textbox('Enter Your Details', context),
          Theme(
            data: ThemeData(
                accentColor: text,
                primaryColor: text,
                colorScheme: ColorScheme.light(
                  primary: text,
                )),
            child: new Stepper(
              steps: [
                //step 1
                new Step(
                    title: Text(
                      'Personal Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                          fontSize: 18,
                          color: text),
                    ),
                    isActive: true,
                    content: Column(
                      children: [
                        //first name text field
                        txtformfield('First Name', context),
                        SizedBox(
                          height: 10,
                        ),
                        //last name
                        txtformfield('Last Name', context),
                      ],
                    )),
                //step2
                new Step(
                    title: Text('Contact Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans',
                            fontSize: 18,
                            color: text)),
                    isActive: true,
                    content: Column(children: [
                      //phone number
                      txtformfield('Phone Number', context),
                      SizedBox(
                        height: 10,
                      ),
                      txtformfield('Email Id', context),
                    ])),
                new Step(
                  title: Text('Voter Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                          fontSize: 18,
                          color: text)),
                  isActive: true,
                  content: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      //row widget has a txtfield and a calender icon
                      Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: TextFormField(
                              onSaved: (value) {
                                data.dob = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter the Date';
                                } else
                                  return null;
                              },
                              controller: dateCon,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(width: 1.5),
                                ),
                                fillColor: textBoxBack,
                                filled: true,
                                labelText: 'Date of Birth',
                                labelStyle: TextStyle(
                                    color: hintText, fontFamily: 'ProductSans'),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(width: 100),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: 50,
                              child: TextButton(
                                child: SvgPicture.asset(
                                    "assets/icons/calendar.svg",
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.width *
                                        .04),
                                onPressed: () {
                                  if (Platform.isAndroid)
                                    _selectDate(context);
                                  else {
                                    _iosSelectDate(context);
                                  }
                                },
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      txtformfield('Voter Id', context),
                      SizedBox(height: 10),
                      txtformfield('Aadhar Number', context)
                    ],
                  ),
                ),
              ],
              //working of the stepper is defined here
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (currStep < 2) {
                    currStep = currStep + 1;
                  } else {
                    _submitDetails();
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
              //controlBuilder used to customize the continue and cancel button
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      //continue button customization
                      child: TextButton(
                        onPressed: onStepContinue,
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: navIcon, fontFamily: 'ProductSans'),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(submitGrey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                        ),
                      ),
                    ),
                    //cancel button customization
                    TextButton(
                      onPressed: onStepCancel,
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: navIcon, fontFamily: 'ProductSans'),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(submitGrey),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ]),
      )),

      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.06,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Row(children: <Widget>[
            Text(
              'Continue',
              style: TextStyle(color: navIcon, fontFamily: 'ProductSans'),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: navIcon,
            )
          ]),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }
}

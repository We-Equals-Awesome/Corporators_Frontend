import 'dart:io';

import 'package:cropapp/Utils/Icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Residents.dart';
import 'dropDownMenu.dart';

//A list called Details is created to store the data given by the User
var Details = new List();

class dataEntry extends StatefulWidget {
  var address = new List();
  dataEntry({this.address});
  @override
  _dataEntryState createState() => _dataEntryState(address);
}

class _dataEntryState extends State<dataEntry> {
  var address = new List();
  _dataEntryState(this.address);
  //sets the Details list back to empty list when a new state is begun
  void initState() {
    Details = [];
  }

  int _currentStep = 0; //variable for the stepper count

  //variable for storing the Date which is initilaized to current date
  DateTime selectedDate = DateTime.now();
  //variable for the form
  final _formKey = GlobalKey<FormState>();

  //TextEditingControllers for storing the date
  final TextEditingController _dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //stroing the date clicked by the user in the TextEditingController
    _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    return Scaffold(
      //defines the background of the Application; Color background is defined in Utils/color.dart
      backgroundColor: background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                //calling the textbox Widget function

                _displayText('Enter the Details', context),
                Expanded(
                  //Theme is called to change the colors of the Stepper Widget from default to the required Colors
                  child: Theme(
                    data: ThemeData(
                        //all the colors are set to black as per the requirements in the design
                        accentColor: Colors.black,
                        primaryColor: Colors.black,
                        colorScheme: ColorScheme.light(
                          primary: Colors.black,
                        )),
                    //the Stepper Widget is called here
                    child: Stepper(
                      //controlsBuilder is used for changing the continue and cancel
                      //button of the original stepper to the required buttons
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Padding(
                          padding: EdgeInsets.only(top: 20, left: 0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 75,
                                child: TextButton(
                                  onPressed: onStepContinue,
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: navIcon,
                                        fontFamily: 'Product_Sans_Bold'),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            submitGrey),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 75,
                                child: TextButton(
                                  onPressed: onStepCancel,
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        color: hintText,
                                        fontFamily: 'Product_Sans_Bold'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued, //continue button
                      onStepCancel: cancel, //cancel button
                      steps: <Step>[
                        //1st Step
                        Step(
                          title: new Text(
                            'Personal Details',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Product_Sans_Bold',
                                fontWeight: FontWeight.bold),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              //calling the box Widget function
                              _textForm('First Name', context),
                              _textForm('Last Name', context)
                            ],
                          ),
                        ),
                        //2nd Step
                        Step(
                          title: new Text(
                            'Contact Details',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Product_Sans_Bold',
                                fontWeight: FontWeight.bold),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              //calling the box Widget function
                              _textForm('Phone Number', context),
                              _textForm('Email', context)
                            ],
                          ),
                        ),

                        //3rd Step
                        Step(
                          title: new Text(
                            'Voter Details',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Product_Sans_Bold',
                                fontWeight: FontWeight.bold),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                //Since the design requires the Calender beside the textField, Row widget is used
                                //The row consists of the box Widget function and the Icon Widget
                                child: Row(
                                  children: [
                                    Container(
                                      width: 260,
                                      child: TextFormField(
                                        onSaved: (value) {
                                          //saving the selected date into the Details List
                                          Details.add(value);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter the Date';
                                          }
                                        },
                                        controller: _dateController,
                                        decoration: new InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            borderSide: BorderSide(width: 1.5),
                                          ),
                                          fillColor: textBoxBack,
                                          filled: true,
                                          labelText: 'YYYY-MM-DD',
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            borderSide: BorderSide(width: 100),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    //following is the Calender icon of svg type
                                    SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: TextButton(
                                            child: SvgPicture.asset(calendar),
                                            onPressed: () {
                                              if (Platform.isIOS)
                                                _iosDate();
                                              else
                                                _androidDate(context);
                                            })),
                                  ],
                                ),
                              ),
                              //calling the box Widget function
                              _textForm('Voter ID', context),
                              _textForm('Aadhar Number', context)
                            ],
                          ),
                        ),
                        //Step 4
                        Step(
                            title: new Text(
                              'Relationship with Head of Family',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Product_Sans_Bold',
                                  fontWeight: FontWeight.bold),
                            ),
                            isActive: true,
                            content: ExampleScreen()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //The floating action button for the Submit Button as per the design
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Submit',
            style: TextStyle(
              fontFamily: 'Product_Sans_Bold',
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  //following are the functions for the working of the Stepper Widget
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Widget _textForm(String a, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: TextFormField(
          autocorrect: false,
          onSaved: (value) {
            //appends the textFormFeild into the Details List
            Details.add(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter the ' + a;
            }
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
            labelText: a,
            labelStyle:
                TextStyle(color: hintText, fontFamily: 'Product_Sans_Bold'),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 100),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayText(String a, BuildContext context) {
    //function for displaying any text as per the requirement
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60),
        child: Text(
          a,
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Product_Sans_Bold',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //following is the code for sacing the form data and validating if text is entered or not
  void _submitDetails() {
    final FormState formState = _formKey.currentState;
    _formKey.currentState.save();
    if (formState.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => resident(address: address),
      ));
    }
    ;
  }

  //following is the code for selecting the date
  _androidDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1975),
        lastDate: DateTime(2030),
        initialDatePickerMode: DatePickerMode.year,
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _iosDate() async {
    DateTime picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = selectedDate ?? DateTime.now();
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = picked.toString();
      });
    }
  }
}

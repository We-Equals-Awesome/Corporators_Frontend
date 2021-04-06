import 'package:flutter/material.dart';
import 'package:cropapp/Utils/color.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentStep = 0; //variable for the stepper count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //defines the background of the Application; Color background is defined in Utils/color.dart
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //calling the textbox Widget function
            textbox('Enter the Details', BuildContext),
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
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued, //continue button
                  onStepCancel: cancel, //cancel button
                  steps: <Step>[
                    //1st Step
                    Step(
                      title: new Text(
                        'Personal Information',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      isActive: true,
                      content: Column(
                        children: <Widget>[
                          //calling the box Widget function
                          box('First Name', context),
                          box('Last Name', context)
                        ],
                      ),
                    ),
                    //2nd Step
                    Step(
                      title: new Text(
                        'Contact Information',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      isActive: true,
                      content: Column(
                        children: <Widget>[
                          //calling the box Widget function
                          box('Phone Number', context),
                          box('Email', context)
                        ],
                      ),
                    ),
                    //3rd Step
                    Step(
                      title: new Text(
                        'Voter Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      isActive: true,
                      content: Column(
                        children: <Widget>[
                          //Since the design requires the Calender beside the textField, Row widget is used
                          //The row consists of the box Widget function and the Icon Widget
                          Row(
                            children: <Widget>[
                              SizedBox(
                                  width: 275,
                                  child: box('YYYY/MM/DD', context)),
                              SizedBox(width: 20),
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 20,
                              )
                            ],
                          ),
                          //calling the box Widget function
                          box('Voter ID', context),
                          box('Aadhar Number', context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //calling the textbox Widget function
            textbox('Add a Family Member', BuildContext),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              //Row is used since 2 icons are displayed beside one another as per the design
              child: Row(
                children: <Widget>[
                  Icon(Icons.account_circle_outlined,
                      color: hintText, size: 30),
                  SizedBox(width: 10),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      //The floating action button for the Submit Button as per the design
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'Submit',
            style: TextStyle(
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
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Widget box(String a, BuildContext context) {
    //function for the Text Fields
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 43,
        child: TextFormField(
          decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.5),
            ),
            fillColor: textBoxBack,
            filled: true,
            labelText: a,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 100),
            ),
          ),
        ),
      ),
    );
  }

  Widget textbox(String a, BuildContext) {
    //function for the TextBox
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Text(
          a,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

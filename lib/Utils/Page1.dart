import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Align( 
              alignment: Alignment.centerLeft, //left align
              child: Padding( //
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: Text(
                  'Enter the Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued, //continue button
                onStepCancel: cancel, //cancel button
                steps: <Step>[
                  Step( //1st Step
                    title: new Text(''),
                    isActive: true,
                    content: Column(
                      children: <Widget>[
                        box('First Name', context),
                        box('Last Name', context)
                      ],
                    ),
                  ),
                  Step( //2nd Step
                    title: new Text(''),
                    isActive: true,
                    content: Column(
                      children: <Widget>[
                        box('Phone Number', context),
                        box('Email', context)
                      ],
                    ),
                  ),
                  Step( //3rd Step
                    title: new Text(''),
                    isActive: true,
                    content: Column(
                      children: <Widget>[
                        box('YYYY/MM/DD', context),
                        box('Voter ID', context),
                        box('Aadhar Number', context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Add a Family Member',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Widget box(String a, BuildContext context) { //function for the Text Fields
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        decoration: new InputDecoration(
          labelText: a,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }


  
}

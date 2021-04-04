import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int _currentStep = 0;
  var firstName;
  final firstNameCon = new TextEditingController();
  var lastName;
  final lastNameCon = new TextEditingController();
  var phoneNumber;
  final phoneNumberCon = new TextEditingController();
  var email;
  final emailCon = new TextEditingController();
  var aadharNumber;
  final aadharNumberCon = new TextEditingController();
  var voterId;
  final voterIdCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(height: 60),
        Container(
          child: Text(
            'Create Account',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.bottomLeft,
          margin: new EdgeInsets.symmetric(horizontal: 20.0),
        ),
        SizedBox(height: 20),
        Container(
          child: Text(
            'Enter Your Details',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.bottomLeft,
          margin: new EdgeInsets.symmetric(horizontal: 20.0),
        ),
        Stepper(
          steps: _mySteps(),
          currentStep: this._currentStep,
          onStepTapped: (step) {
            setState(() {
              this._currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (this._currentStep < this._mySteps().length - 1) {
                this._currentStep = this._currentStep + 1;
              } else {
                //Logic to check if everything is completed
                print('Completed, check fields.');
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
          },
        ),
      ]),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Step 1'),
        content: Column(
          children: <Widget>[
            TextField(
              controller: firstNameCon,
              decoration: new InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "First Name",
                fillColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: lastNameCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "Last Name",
                fillColor: Colors.grey[300],
              ),
            )
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Step 2'),
        content: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.phone,
              controller: phoneNumberCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "Phone Number",
                fillColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "Email",
                fillColor: Colors.grey[300],
              ),
            )
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Step 3'),
        content: Column(
          children: <Widget>[
            TextField(
              controller: phoneNumberCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "DOB",
                fillColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: voterIdCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "Voter ID",
                fillColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: aadharNumberCon,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "Aadhar Number",
                fillColor: Colors.grey[300],
              ),
            )
          ],
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}

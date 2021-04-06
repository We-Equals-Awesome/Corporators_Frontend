import 'package:flutter/material.dart';
import 'package:fa_stepper/fa_stepper.dart';
//import 'package:validate/validate.dart';  //for validation

class MyData {
  var firstName = '';
  var lastName = '';
  var phoneNumber = '';
  var email = '';
  var dob = '';
  var aadharNumber = '';
  var voterId = '';
}

class fa extends StatefulWidget {
  @override
  _faState createState() => _faState();
}

class _faState extends State<fa> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<FAStep> steps = [
    //step 1
    new FAStep(
        title: const Text(
          'Step 1',
          style: TextStyle(color: Colors.black),
        ),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        //state: StepFAState.indexed,
        content: Column(
          children: [
            //first name text field
            new TextFormField(
              focusNode: _focusNode,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                data.firstName = value;
              },
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty) {
                  //code to validate first name
                  return 'Please enter name';
                } else
                  return null;
              },
              decoration: new InputDecoration(
                  hintText: 'First Name',
                  fillColor: Colors.grey[300],
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            ),
            SizedBox(
              height: 10,
            ),
            //last name
            new TextFormField(
              focusNode: _focusNode,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                data.lastName = value;
              },
              maxLines: 1,
              validator: (value) {
                if (value.isEmpty || value.length < 1) {
                  //code to validate last name
                  return 'Please enter name';
                } else
                  return null;
              },
              decoration: new InputDecoration(
                  hintText: 'Last Name',
                  fillColor: Colors.grey[300],
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            ),
          ],
        )),

    //step2
    new FAStep(
        title: const Text('Step 2'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        //state: StepState.indexed,
        content: Column(children: [
          new TextFormField(
            keyboardType: TextInputType.phone,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid number';
              } else
                return null;
            },
            onSaved: (String value) {
              data.phoneNumber = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Phone Number',
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          SizedBox(
            height: 10,
          ),
          new TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid email id';
              } else
                return null;
            },
            onSaved: (String value) {
              data.email = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Email ID',
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
        ])),
    new FAStep(
        title: const Text('Step 3'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.indexed,
        // state: StepState.disabled,
        content: Column(children: [
          //Date of birth text field
          new TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid date of birth';
              } else
                return null;
            },
            onSaved: (String value) {
              data.dob = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'YYYY/MM/DD',
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          SizedBox(
            height: 10,
          ),
          //voter id
          new TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid voter ID';
              } else
                return null;
            },
            onSaved: (String value) {
              data.voterId = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Voter ID',
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          SizedBox(
            height: 10,
          ),
          //aadhar number
          new TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid aadhar number';
              } else
                return null;
            },
            onSaved: (String value) {
              data.aadharNumber = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Aadhar Number',
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
        ])),

    // new Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("First Name: ${data.firstName}");
        print("Last Name: ${data.lastName}");
        print("Phone Number: ${data.phoneNumber}");
        print("Email: ${data.email}");
        print("Date of Birth: ${data.dob}");
        print("Voter ID: ${data.voterId}");
        print("Aadhar Number: ${data.aadharNumber}");

        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Details saved:'),
              content: SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("First Name : " + data.firstName),
                    new Text("Last Name : " + data.lastName),
                    new Text("Phone Number : " + data.phoneNumber),
                    new Text("Email : " + data.email),
                    new Text("date of Birth: " + data.dob),
                    new Text("Voter ID : " + data.voterId),
                    new Text("Aadhar Number : " + data.aadharNumber),
                  ],
                ),
              ),
              actions: <Widget>[
                new TextButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: new Container(
          child: new Form(
        key: _formKey,
        child: new ListView(children: <Widget>[
          SizedBox(height: 50),
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
          new FAStepper(
            steps: steps,
            type: FAStepperType.vertical,
            stepNumberColor: Colors.black,
            currentStep: this.currStep,
            onStepContinue: () {
              setState(() {
                if (currStep < steps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  currStep = 0;
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
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: onStepContinue,
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onStepCancel,
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.amber),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            width: 40,
            height: 30,
            child: ElevatedButton(
              onPressed: _submitDetails,
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.amber),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  )),
            ),
          ),
        ]),
      )),
    );
  }
}

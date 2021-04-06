import 'package:cropapp/UI/almostDone.dart';
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

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                  fillColor: Colors.grey[200],
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
              // focusNode: _focusNode,
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

    //method that saves the current state of the form
    void _submitDetails() {
      final FormState formState = _formKey.currentState;
      //message to enter correct data if the validation returns false
      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        //save current form state if validation returns true
        formState.save();
        print("First Name: ${data.firstName}");
        print("Last Name: ${data.lastName}");
        print("Phone Number: ${data.phoneNumber}");
        print("Email: ${data.email}");
        print("Date of Birth: ${data.dob}");
        print("Voter ID: ${data.voterId}");
        print("Aadhar Number: ${data.aadharNumber}");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AlmostDone()));
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 212, 146, 1.0),
      //body is a container with child as a form that has the textfields
      body: new Container(
          child: new Form(
        key: _formKey,
        //textfields are wrapped in a list view
        child: new ListView(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.053),
          //container has the text 'create account'
          Container(
            child: Text(
              'Create Account',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.bottomLeft,
            margin: new EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.055),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          //container has the text 'Enter your details'
          Container(
            child: Text(
              'Enter Your Details',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.bottomLeft,
            margin: new EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
          ),
          //creating a stepper
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
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey[800]),
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
                      style: TextStyle(color: Colors.amber),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[800]),
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
          //container that the final continue button
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: _submitDetails,
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.amber),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800],
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      )),
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}

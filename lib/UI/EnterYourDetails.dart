//import 'package:cropapp/UI/almostDone.dart';
import 'package:cropapp/UI/LoginPage.dart';
import 'package:flutter/material.dart';
//import 'package:cropapp/UI/login2.dart'; //class to store info about user

class MyData {
  var firstName;
  final firstNameCon = new TextEditingController();
  var lastName;
  final lastNameCon = new TextEditingController();
  var phoneNumber;
  final phoneNumberCon = new TextEditingController();
  var email;
  final emailCon = new TextEditingController();
  var address1;
  final address1Con = new TextEditingController();
  var address2;
  final address2Con = new TextEditingController();
}

class enterYourDetails extends StatefulWidget {
  @override
  _enterYourDetailsState createState() => _enterYourDetailsState();
}

class _enterYourDetailsState extends State<enterYourDetails> {
  int currStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData();

  List<Step> steps = [
    //step 1
    new Step(
        title: const Text(
          'Step 1',
          style: TextStyle(color: Colors.black),
        ),
        isActive: true,
        content: Column(
          children: [
            //first name text field
            new TextFormField(
              keyboardType: TextInputType.text,
              controller: data.firstNameCon,
              autocorrect: false,
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
            //last name field
            new TextFormField(
              keyboardType: TextInputType.text,
              controller: data.lastNameCon,
              autocorrect: false,
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
    new Step(
        title: const Text('Step 2'),
        isActive: true,
        content: Column(children: [
          new TextFormField(
            keyboardType: TextInputType.phone,
            controller: data.phoneNumberCon,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid number';
              } else
                return null;
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
            controller: data.emailCon,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid email id';
              } else
                return null;
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
    //step 3
    new Step(
        title: const Text('Step 3'),
        isActive: true,
        content: Column(children: [
          //Date of birth text field
          new TextFormField(
            keyboardType: TextInputType.text,
            controller: data.address1Con,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid Address';
              } else
                return null;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Address 1',
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
          //address 2
          new TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: data.address2Con,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter address';
              } else
                return null;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                hintText: 'Address 2 (Optional)',
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
        showSnackBarMessage('Please fill all fields');
      } else {
        //show alter box if voter id doesnt below to the ward
        if (data.address1 == '1') {
          print('address 1 is 1 ');
          print("First Name: ${data.firstName}");
          print("Last Name: ${data.lastName}");
          print("Phone Number: ${data.phoneNumber}");
          print("Email: ${data.email}");
          print("ad1 : ${data.address1}");
          print("ad2 : ${data.address2}");
        } else {
          //save current form state if validation returns true
          formState.save();
          print("First Name: ${data.firstName}");
          print("Last Name: ${data.lastName}");
          print("Phone Number: ${data.phoneNumber}");
          print("Email: ${data.email}");
          print("ad1 : ${data.address1}");
          print("ad2 : ${data.address2}");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyHomePage(1)));
        }
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
              'Enter Your Details',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.bottomLeft,
            margin: new EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.055),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.015),

          Theme(
            data: ThemeData(
                //all the colors are set to black as per the requirements in the design
                accentColor: Colors.black,
                primaryColor: Colors.black,
                colorScheme: ColorScheme.light(
                  primary: Colors.black,
                )),
            //the Stepper Widget is called here
            child:
                //creating a stepper
                new Stepper(
              steps: steps,
              type: StepperType.vertical,
              //stepNumberColor: Colors.black,
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[800]),
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
          //container that the final continue button
          Container(
            //width: 100,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                child: ElevatedButton(
                  onPressed: _submitDetails,
                  child: Row(children: <Widget>[
                    Text(
                      'Continue',
                      style: TextStyle(color: Colors.amber),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.amber,
                      ),
                    )
                  ]),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800],
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
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}

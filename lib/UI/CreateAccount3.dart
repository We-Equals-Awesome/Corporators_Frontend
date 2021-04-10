import 'package:cropapp/UI/almostDone.dart';
import 'package:flutter/material.dart';
import 'package:cropapp/UI/EnterYourDetails.dart';
import 'package:cropapp/Utils/color.dart';

//class to store info about user
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
  @override
  void initState() {
    super.initState();
  }

  TextEditingController Con;
  DateTime selectedDate = DateTime.now(); //stores the value of selectedDate
  final TextEditingController dateCon =
      new TextEditingController(); //dateField controller
  int currStep = 0; //set the initial step to 0
  GlobalKey<FormState> _formKey =
      new GlobalKey<FormState>(); //stores the form state
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
                borderRadius: BorderRadius.all(Radius.circular(55.0))),
            backgroundColor: Color.fromRGBO(243, 231, 205, 1),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                    'Oops seems like you are not  part of this ward.\nContact your ward incharge',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          //open Enter your details page when Continue button pressed
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => enterYourDetails()));
                        },
                        child: Row(children: <Widget>[
                          Text(
                            'Continue',
                            style: TextStyle(color: Colors.amber),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.amber,
                          )
                        ]),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[800],
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.12,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            )),
                      ), // button 1
                    ])
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    dateCon.text = "${selectedDate.toLocal()}".split(' ')[0];
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
          initialDate: selectedDate, // Refer step 1
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
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

    //function that returns a texteformfield
    Widget txtformfield(String s, BuildContext context) {
      //function for the Text Fields
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          child: TextFormField(
            controller: Con,
            keyboardType:
                s == 'Phone Number' ? TextInputType.phone : TextInputType.text,
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
              } else
                return null;
            },
            decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1.5),
              ),
              fillColor: textBoxBack,
              filled: true,
              labelText: s,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 100),
              ),
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
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Text(
            a,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
          print('First Name : ' + data.firstName);
          print('last name :' + data.lastName);
          print('voter : ' + data.voterId);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AlmostDone()));
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
          Theme(
            data: ThemeData(
                //all the colors are set to black as per the requirements in the design
                accentColor: Colors.black,
                primaryColor: Colors.black,
                colorScheme: ColorScheme.light(
                  primary: Colors.black,
                )),
            child: new Stepper(
              steps: [
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
                    title: const Text('Step 2'),
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
                  title: const Text('Step 3'),
                  isActive: true,
                  content: Column(
                    children: <Widget>[
                      //row widget has a txtfield and a calender icon
                      Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
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
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(width: 1),
                                ),
                                fillColor: textBoxBack,
                                filled: true,
                                labelText: 'YYYY-MM-DD',
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
                                child: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context),
                              )),
                        ],
                      ),
                      txtformfield('Voter Id', context),
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
        ]),
      )),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Continue',
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
}

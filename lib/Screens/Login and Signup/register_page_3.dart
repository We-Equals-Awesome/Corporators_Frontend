import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';
import 'login_page_1.dart';

//class to store info about the user
class MyData {
  var firstName = '';
  var lastName = '';
  var phoneNumber = '';
  var email = '';
  var address1 = '';
  var address2 = '';
}

//page to enter your details
class RegisterPage3 extends StatefulWidget {
  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
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
    //function that returns a texteformfield
    Widget txtformfield(String s, BuildContext context) {
      //function for the Text Fields
      return Padding(
        padding: const EdgeInsets.only(top: 10),
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
            else if (s == 'Address 1')
              data.address1 = value;
            else if (s == 'Address 2 (Optional)') data.address2 = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return s + ' is required.';
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
    Widget textbox(String s, BuildContext context) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Text(
            s,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans'),
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
        //save current form state if validation returns true
        formState.save();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage1(1)));
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          //container has the text 'create account'
          Container(
            child: Text(
              'Enter Your Details',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                  fontWeight: FontWeight.bold,
                  color: text,
                  fontFamily: 'ProductSans'),
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
            child: new Stepper(
              steps: [
                //step 1
                new Step(
                    title: Text(
                      'Personal Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: text,
                          fontSize: 18,
                          fontFamily: 'ProductSans'),
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
                  title: Text('Address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans',
                          fontSize: 18,
                          color: text)),
                  isActive: true,
                  content: Column(
                    children: <Widget>[
                      txtformfield('Address 1', context),
                      txtformfield('Address 2 (Optional)', context)
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
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Submit',
            style: TextStyle(
                color: navIcon, fontSize: 13.0, fontFamily: 'ProductSans'),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }
}

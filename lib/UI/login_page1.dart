import 'package:flutter/material.dart';
import 'register_page1.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:cropapp/UI/login_page2.dart';

/*Login Page 1 takes the phone number from the user to login
or allows the user to navigate to Register Page1.*/
class LoginPage1 extends StatefulWidget {
  //Alter is to decide whether or not to show the ALterDialogue box in login page.
  final int alter;
  LoginPage1(this.alter); //constructor to store the value of alter variable
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  var phoneNumber;
  //formkey is used for form that takes phone number and password
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //function that returns the textformfields
  Widget txtformfield(String s, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          cursorColor: hintText,
          keyboardType: TextInputType.phone,
          validator: (String value) {
            if (value.isEmpty)
              return 'Phone Number is required';
            else if (value.length < 9)
              return 'Please enter a valid phone number';
            return null;
          },
          onSaved: (String value) {
            phoneNumber = value;
          },
          decoration: new InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 100),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            filled: true,
            labelStyle:
                new TextStyle(color: hintText, fontFamily: 'product-sans'),
            labelText: "Phone Number",
            fillColor: textBoxBack,
          ),
        ));
  }

//widget that returns a button
  Widget button(String s, BuildContext context) {
    return ElevatedButton(
      onPressed: s == 'Generate OTP'
          ? () {
              //when login button clicked, the formstate is saved if valid
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage2()));
            }
          : () {
              //open CreateAccountPage when Create button pressed
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage1()));
            },
      child: Text(s == 'Generate OTP' ? 'Generate OTP' : 'Create',
          style: TextStyle(color: navIcon, fontFamily: 'product-sans')),
      style: ElevatedButton.styleFrom(
          primary: submitGrey,
          padding: EdgeInsets.symmetric(
              horizontal: s == 'Create'
                  ? MediaQuery.of(context).size.width * 0.12
                  : MediaQuery.of(context).size.width * 0.07,
              vertical: MediaQuery.of(context).size.height * 0.01),
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            fontWeight: FontWeight.bold,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
    );
  }

  //init state to call alter dialgoue
  void initState() {
    super.initState();
    /*When the user is redirected to the Login page from the 'EnterYourDetailsPage',
      then the AlterDialogue Box is shown. The value of alter passed is 1 in this case*/
    if (widget.alter == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(55.0))),
            backgroundColor: textBoxBack,
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                  'Our booth volunteer will soon be in touch with you.',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'product-sans',
                      color: text),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); //go back to login page when Continue is clicked
                        },
                        child: Text(
                          'Okay',
                          style: TextStyle(
                              color: navIcon, fontFamily: 'product-sans'),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: submitGrey,
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
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
                      //container to store the circular logo
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('Assets/assets/logo.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      //text for the app name
                      Center(
                        child: Text(
                          'App Something',
                          style: TextStyle(
                              color: text,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'product-sans'),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045),
                      //container that has a textformfield to store phone number
                      txtformfield('Phone Number', context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //elevated button Login
                      button('Generate OTP', context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14),
                      Container(
                        child: Text(
                          'Are you a citizen of this ward? Create Account',
                          style: TextStyle(
                              color: text,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'product-sans'),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //elevated button 'Create'CreateAccount
                      button('Create', context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

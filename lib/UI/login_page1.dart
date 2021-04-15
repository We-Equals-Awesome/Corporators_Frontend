import 'package:flutter/material.dart';
import 'register_page1.dart';
import 'package:cropapp/Utils/color.dart';

class MyHomePage extends StatefulWidget {
  final int
      alter; //This value is to decide whether or not to show the ALterDialogue box in login page.
  MyHomePage(this.alter); //constructor to store the value of alter variable
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var password;
  var phoneNumber;
  //formkey is used for form that takes phone number and password
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //isHidden stores the visibility of password
  bool _isHidden = true;
  //method to toggle the visibility of password
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden; //changes the visibility by negating it
    });
  }

  //function that returns the textformfields
  Widget txtformfield(String s, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          keyboardType:
              s == 'Phone Number' ? TextInputType.phone : TextInputType.text,
          validator: (String value) {
            if (value.isEmpty) {
              if (s == 'Phone Numer')
                return 'Phone Number is required';
              else
                return 'Password is required';
            }
            return null;
          },
          onSaved: (String value) {
            if (s == 'Phone Number')
              phoneNumber = value;
            else
              password = value;
          },
          obscureText: s == 'Password' ? _isHidden : false,
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
            labelText: s == 'Phone Number' ? "Phone Number" : 'Password',
            fillColor: textBoxBack,
            suffixIcon: s == 'Password'
                ? IconButton(
                    onPressed: _toggleVisibility,
                    icon: _isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
          ),
        ));
  }

//widget that returns a button
  Widget button(String s, BuildContext context) {
    return ElevatedButton(
      onPressed: s == 'Login'
          ? () {
              //when login button clicked, the formstate is saved if valid
              if (!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
            }
          : () {
              //open CreateAccountPage when Create button pressed
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateAccount()));
            },
      child: Text(s == 'Login' ? 'Login' : 'Create',
          style: TextStyle(color: navIcon, fontFamily: 'product-sans')),
      style: ElevatedButton.styleFrom(
          primary: submitGrey,
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
            backgroundColor: background,
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text('Our booth volunteer will soon be in touch with you.',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.035,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'product-sans')),
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
                              image: AssetImage('lib/Utils/assets/logo.jpg'),
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
                      txtformfield('Password', context),
                      //container that has a textformfield to store password
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      //elevated button Login
                      button('Login', context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Container(
                        child: Text(
                          'Are you a citizen of this ward? Create Account',
                          style: TextStyle(
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

import 'package:flutter/material.dart';
import 'CreateAccount3.dart';

class MyHomePage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 212, 146, 1.0),
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
                          'App Somethinsssg',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045),
                      //container that has a textformfield to store phone number
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Phone Number is Required';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              phoneNumber = value;
                            },
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
                              fillColor:
                                  const Color.fromRGBO(243, 231, 205, 1.0),
                            ),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //container that has a textformfield to store password
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Password is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            password = value;
                          },
                          obscureText: _isHidden,
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
                            hintText: "Password",
                            fillColor: const Color.fromRGBO(243, 231, 205, 1.0),
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      //column that has an elevated button Login
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              //when login button clicked, the formstate is saved if valid
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();

                              print("Password: $password");
                              print("Phone Number: $phoneNumber");
                              //Send to API
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.amber),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[800],
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.12,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                textStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Container(
                        child: Text(
                          'Are you a citizen of this ward? Create Account',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //column that has an elevated button 'Create'CreateAccount
                      Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              //open CreateAccountPage when Create button pressed
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                            },
                            child: Text('Create',
                                style: TextStyle(color: Colors.amber)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[800],
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.12,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

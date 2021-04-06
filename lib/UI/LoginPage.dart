//import 'package:cropapp/UI/CreateAccountPage2.dart';
import 'package:flutter/material.dart';
//import 'CreateAcount.dart';
//import 'StepperForm.dart';
import 'CreateAccount3.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var password;
  var phoneNumber;
  final passwordCon = new TextEditingController();
  final phoneNumberCon = new TextEditingController();
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
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 70),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('lib/Utils/assets/logo.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'App Somethisssng',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                    width: 270,
                    child: TextField(
                      controller: phoneNumberCon,
                      keyboardType: TextInputType.phone,
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
                        fillColor: const Color.fromRGBO(243, 231, 205, 1.0),
                      ),
                    )),
                SizedBox(height: 10),
                Container(
                  width: 270,
                  child: TextField(
                    controller: passwordCon,
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
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          phoneNumber = phoneNumberCon.text;
                          password = passwordCon.text;
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[800],
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
                SizedBox(height: 50),
                Text(
                  'Are you a citizen of this ward ? Create Account',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        //open CreateAccountPage when Create button pressed
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => fa()));
                      },
                      child:
                          Text('Create', style: TextStyle(color: Colors.amber)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[800],
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
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
        )));
  }
}

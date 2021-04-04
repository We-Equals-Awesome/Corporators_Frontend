import 'package:flutter/material.dart';
import '\CreateAcount.dart';
import '\StepperForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var password;
  var phoneNumber;
  final passwordCon = new TextEditingController();
  final phoneNumberCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'App Something',
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
                    fillColor: Colors.grey[300],
                  ),
                )),
            SizedBox(height: 10),
            Container(
              width: 270,
              child: TextField(
                controller: passwordCon,
                obscureText: true,
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
                    fillColor: Colors.grey[300]),
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
                  child: Text('Login'),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccountPage()));
                  },
                  child: Text('Create'),
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

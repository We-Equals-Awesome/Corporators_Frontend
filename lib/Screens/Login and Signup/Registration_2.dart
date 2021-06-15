import 'dart:io';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Login_Page_1.dart';

//almost done page
class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  PickedFile _imageFile; //this variable stores the selected profile image
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Con =
      TextEditingController(); //controller for OTP field

  //this function returns the profile image
  Widget imageProfile() {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: background,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/icons/user.png')
                : FileImage(File(_imageFile.path)),
            radius: MediaQuery.of(context).size.width * 0.12,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              left: MediaQuery.of(context).size.width * 0.45,
              child: RawMaterialButton(
                constraints: BoxConstraints.tight(Size(
                    MediaQuery.of(context).size.width * 0.07,
                    MediaQuery.of(context).size.width * 0.07)),
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                elevation: 1.0,
                fillColor: textBoxBack,
                child: SvgPicture.asset("assets/icons/camera.svg"),
                padding: EdgeInsets.all(1.0),
                shape: CircleBorder(),
              )),
        ],
      ),
    ));
  }

  //this function opens the gallery and sets the image choosen by the user to  pickedFile
  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    //function to show snack bar if all the fields are not filled
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    //this function returns a textformfield for OTP
    Widget textfield(String s, BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 5),
        child: TextFormField(
          cursorColor: hintText,
          validator: (String value) {
            if (value.isEmpty) return s + ' is Required';
            return null;
          },
          controller: Con,
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

    //this function returns text with the required styling
    Widget textBox(String s, BuildContext context) {
      return Container(
        child: Text(
          s,
          style: TextStyle(
              fontSize: s == 'Almost Done' ? 27 : 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'ProductSans',
              color: text),
        ),
        alignment: Alignment.bottomLeft,
        margin: new EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.043,
                ),
                textBox('Almost Done', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                textBox('Setting Up Your Profile', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                imageProfile(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                textBox('Confirm OTP', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                textfield('OTP', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                //submit button that directs to login page 1
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      showSnackBarMessage(
                          'Please fill all fields with valid input');
                    } else {
                      _formKey.currentState.save();
                      print('pass $Con.text');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage1(1)));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: navIcon),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: submitGrey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProductSans'),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

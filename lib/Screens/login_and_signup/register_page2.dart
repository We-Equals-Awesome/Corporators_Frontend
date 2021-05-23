import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cropapp/Screens/login_and_signup/login_page1.dart';

//almost done page
class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  PickedFile _imageFile; //this variable stores the selected profile image
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //isHidden stores the visibility of password
  bool _isHidden = true;
  bool _isCHidden = true;
  TextEditingController passwordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();
  //method to toggle the visibility of password
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden; //changes the visibility by negating it
    });
  }

  void _toggleCVisibility() {
    setState(() {
      _isCHidden = !_isCHidden; //changes the visibility by negating it
    });
  }

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
                ? AssetImage('Assets/assets/user.png')
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
                child: SvgPicture.asset("lib/Utils/assets/camera.svg"),
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

    Widget _buildPassword(String s, BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: TextFormField(
          cursorColor: hintText,
          obscureText: _isHidden,
          validator: (String value) {
            if (value.isEmpty) return s + ' is Required';
            return null;
          },
          controller: passwordCon,
          decoration: new InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
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
            fillColor: textBoxBack,
            filled: true,
            labelText: s,
            labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
            suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden
                  ? Icon(
                      Icons.visibility_off,
                      color: hintText,
                    )
                  : Icon(
                      Icons.visibility,
                      color: hintText,
                    ),
            ),
          ),
        ),
      );
    }

    Widget _buildCPassword(String s, BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: TextFormField(
          cursorColor: hintText,
          obscureText: _isCHidden,
          controller: confirmPasswordCon,
          validator: (String value) {
            if (value.isEmpty) return s + ' is Required';
            if (passwordCon.text != confirmPasswordCon.text)
              return "Password does not match";
            return null;
          },
          decoration: new InputDecoration(
            isDense: true, // Added this
            contentPadding: EdgeInsets.all(8),
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
            fillColor: textBoxBack,
            filled: true,
            labelText: s,
            labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
            suffixIcon: IconButton(
              onPressed: _toggleCVisibility,
              icon: _isCHidden
                  ? Icon(
                      Icons.visibility_off,
                      color: hintText,
                    )
                  : Icon(
                      Icons.visibility,
                      color: hintText,
                    ),
            ),
          ),
        ),
      );
    }

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
          horizontal: 10.0,
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
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
                textBox('Password', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildPassword('Password', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                textBox('Confirm Password', context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildCPassword('Password', context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      showSnackBarMessage(
                          'Please fill all fields with valid input');
                    } else {
                      _formKey.currentState.save();
                      print('pass $passwordCon.text');
                      print('cpass $confirmPasswordCon.text');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage1(0)));
                      //Send to API
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

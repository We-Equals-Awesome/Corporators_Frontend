import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AlmostDone extends StatefulWidget {
  @override
  _AlmostDoneState createState() => _AlmostDoneState();
}

class _AlmostDoneState extends State<AlmostDone> {
  String _password;
  String _cpassword; //stores the password
  PickedFile _imageFile; //this variable stores the selected profile image
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      decoration: new InputDecoration(
          hintText: 'Password',
          fillColor: Colors.grey[300],
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
    );
  }

  Widget _buildcPassword() {
    return TextFormField(
      decoration: new InputDecoration(
          hintText: 'Confirm Password',
          fillColor: Colors.grey[300],
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          labelStyle:
              new TextStyle(decorationStyle: TextDecorationStyle.solid)),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _cpassword = value;
      },
    );
  }

  //this function returns the profile image
  Widget imageProfile() {
    return Center(
        child: Stack(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.orange[200],
          backgroundImage: _imageFile == null
              ? AssetImage('lib/Utils/assets/user.png')
              : FileImage(File(_imageFile.path)),
          radius: 80,
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child:
                    Icon(Icons.camera_alt, color: Colors.grey[400], size: 28))),
      ],
    ));
  }

  //This function returns a sheet at the bottom of the screen when the image icon is pressed
  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text("Choose Your Profile Picture", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    takephoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
                  onPressed: () {
                    takephoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          ),
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text(
                    'Almost Done',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.bottomLeft,
                  margin: new EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Setting Up Your Profile',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.bottomLeft,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                ),
                SizedBox(
                  height: 20,
                ),
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                _buildPassword(),
                SizedBox(
                  height: 20,
                ),
                _buildcPassword(),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    //print(_password);
                    print("Password: $_password");
                    print("Confirm Password: $_cpassword");

                    //Send to API
                  },
                  child: Text(
                    'Submit',
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
          ),
        ),
      ),
    );
  }
}

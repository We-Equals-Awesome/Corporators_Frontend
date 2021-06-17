import 'dart:io';

import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CitizenPage extends StatefulWidget {
  @override
  _CitizenPageState createState() => _CitizenPageState();
}

List details = [
  '9876543210',
  'abc@test.com',
  '20/05/1944',
  'ABC12345',
  '123456789023'
];

class _CitizenPageState extends State<CitizenPage> {
  PickedFile _imageFile; //this variable stores the selected profile image
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                imageProfile(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'This is the name',
                    style: TextStyle(
                      fontSize: 28,
                      color: text,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textForm("Phone Number", details[0], context),
                    _textForm("Email", details[1], context),
                    _textForm("Date of Birth", details[2], context),
                    _textForm("Voter ID", details[3], context),
                    _textForm("Aadhar Number", details[4], context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: CircleAvatar(
              backgroundColor: background,
              backgroundImage: _imageFile == null
                  ? AssetImage('assets/icons/user.png')
                  : FileImage(File(_imageFile.path)),
              radius: MediaQuery.of(context).size.width * 0.12,
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.09,
              left: MediaQuery.of(context).size.width * 0.53,
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

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget _textForm(String a, String b, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 8, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                a,
                style: TextStyle(
                  color: text,
                  fontFamily: "ProductSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50.0,
            decoration: BoxDecoration(
              color: textBoxBack,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  b,
                  style: TextStyle(
                    color: text,
                    fontFamily: "ProductSans",
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

import 'Residents.dart';

var addressDetails = new List();

class addressPage extends StatefulWidget {
  @override
  _addressPageState createState() => _addressPageState();
}

class _addressPageState extends State<addressPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _displayText('Enter the Address', context),
              _textForm('Street Number', context),
              _textForm('House Number', context)
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Continue',
            style: TextStyle(
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  void _submitDetails() {
    final FormState formState = _formKey.currentState;
    _formKey.currentState.save();
    print(addressDetails);
    if (formState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => resident()),
      );
    }
    ;
  }

  Widget _textForm(String a, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 45),
      child: Container(
        height: 50,
        child: TextFormField(
          //controller: _textFormFeild,
          autocorrect: false,
          onSaved: (value) {
            //appends the textFormFeild into the Details List
            addressDetails.add(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter the ' + a;
            }
          },
          decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.5, color: Colors.red),
            ),
            fillColor: textBoxBack,
            filled: true,
            labelText: a,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 10, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayText(String a, BuildContext context) {
    //function for displaying any text as per the requirement
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60),
        child: Text(
          a,
          style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: text),
        ),
      ),
    );
  }
}

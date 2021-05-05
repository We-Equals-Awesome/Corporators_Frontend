import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'Residents.dart';

var address = new List();

class addressPage extends StatefulWidget {
  @override
  _addressPageState createState() => _addressPageState();
}

class _addressPageState extends State<addressPage> {
  void initState() {
    address = [];
  }

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
              fontFamily: 'ProductSans',
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
    print(address);
    if (formState.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => resident(address: address),
      ));
    } else {
      address = [];
    }
    ;
  }

  Widget _textForm(String a, BuildContext context) {
    //function for the textFormFeilds
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 45),
      child: Container(
        child: TextFormField(
          autocorrect: false,
          onSaved: (value) {
            //appends the textFormFeild into the Details List
            address.add(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter the ' + a;
            }
          },
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
            labelText: a,
            labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 100),
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
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text),
        ),
      ),
    );
  }
}

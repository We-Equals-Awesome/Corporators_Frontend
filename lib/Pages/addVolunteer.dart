import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

class AddVolunteer extends StatefulWidget {
  @override
  _AddVolunteerState createState() => _AddVolunteerState();
}

List details = [];

class _AddVolunteerState extends State<AddVolunteer> {
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Add Volunteer",
                      style: TextStyle(
                          color: text,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProductSans"),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15.0),
                    child: Text(
                      "Enter the details",
                      style: TextStyle(
                          color: text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProductSans"),
                    ),
                  ),
                ),
                _textForm("Phone Number", null, context),
                _textForm("Email", null, context),
                _textForm("First Name", null, context),
                _textForm("Last Name", null, context),
                _textForm("Aadhar Number", null, context),
                // _passwordFields("Password", "p"),
                // _passwordFields("Confirm password", "cp"),
                _textForm("Booth allotted", null, context)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Submit',
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

  Widget _textForm(String a, String b, BuildContext context) {
    //function for the textFormFeilds
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              a,
              style: TextStyle(
                color: text,
                fontFamily: "ProductSans",
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              autocorrect: false,
              onSaved: (value) {
                //appends the textFormFeild into the Details List
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the ' + a;
                }
                return null;
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
                labelStyle:
                    TextStyle(color: hintText, fontFamily: 'ProductSans'),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _passwordFields(String s, String t) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(15.0, 8, 0, 15),
  //         child: Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text(
  //             s,
  //             style: TextStyle(
  //               color: text,
  //               fontFamily: "ProductSans",
  //               fontWeight: FontWeight.bold,
  //               fontSize: 14.0,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
  //         child: Container(
  //           child: TextFormField(
  //             textInputAction: TextInputAction.next,
  //             autocorrect: false,
  //             onSaved: (value) {
  //               //appends the textFormFeild into the Details List
  //             },
  //             validator: (value) {
  //               if (value.isEmpty) {
  //                 return 'Please enter the ' + s;
  //               }
  //               return null;
  //             },
  //             obscureText: !isVisible,
  //             autofocus: true,
  //             decoration: new InputDecoration(
  //               suffixIcon: IconButton(
  //                 icon: Icon(
  //                   // Based on passwordVisible state choose the icon
  //                   (isVisible == true)
  //                       ? Icons.visibility
  //                       : Icons.visibility_off,
  //                   color: hintText,
  //                 ),
  //                 onPressed: () {
  //                   // Update the state i.e. toogle the state of passwordVisible variable
  //                   setState(() {
  //                     isVisible = !isVisible;
  //                   });
  //                 },
  //               ),
  //               contentPadding:
  //                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: new BorderRadius.circular(10.0),
  //                 borderSide: BorderSide(color: Colors.black, width: 1.5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: new BorderRadius.circular(10.0),
  //                 borderSide: BorderSide(color: Colors.black, width: 1.5),
  //               ),
  //               fillColor: textBoxBack,
  //               filled: true,
  //               labelText: s,
  //               labelStyle:
  //                   TextStyle(color: hintText, fontFamily: 'ProductSans'),
  //               border: new OutlineInputBorder(
  //                 borderRadius: new BorderRadius.circular(10.0),
  //                 borderSide: BorderSide(width: 100),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  //  }

  void _submitDetails() {}
}

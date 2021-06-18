import 'package:Corporator_Mobile_App/Screens/Admin/Admin_Home_Feed_2.dart';
import 'package:Corporator_Mobile_App/Screens/Admin/Admin_Volunteer_1.dart';
import 'package:Corporator_Mobile_App/Screens/complaints/Citizen_Complaints_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';

import 'Volunteer_Page_1.dart';
import 'Volunteer_Page_2.dart';
import 'Volunteer_Page_3.dart';

class volunteerConsole extends StatefulWidget {
  volunteerConsole({Key key}) : super(key: key);

  @override
  _volunteerConsoleState createState() => _volunteerConsoleState();
}

class _volunteerConsoleState extends State<volunteerConsole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    "Volunteer Console",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProductSans',
                        color: text),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      child: Text(
                        "Active Complaints",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans',
                            color: text),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 15, bottom: 10),
                      child: InkWell(
                        child: Text(
                          "View All ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'ProductSans',
                              color: text),
                        ),
                        onTap: () {
                          // Have to add the view all wala list here to navigate

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplaintsView()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: _complaintsCard(
                              'Sewage', '17', '07-11-2020', context),
                        );
                      }),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: Text(
                        "Recently Added",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans',
                            color: text),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 15, bottom: 10),
                      child: InkWell(
                        child: Text(
                          "View All ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'ProductSans',
                              color: text),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => viewAll()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: _card(
                              '213/A', 'Bhoomika', '15', '21/21/21', context),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {
            sflag = 1;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => dataEntry(sflag: sflag),
              ),
            );
          },
          label: Text(
            'New House',
            style: TextStyle(
              fontFamily: 'ProductSans',
              color: navIcon,
              fontSize: 14.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }
}

Widget _complaintsCard(String a, String b, String c, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WallFeedUpdated(),
        ));
      },
      child: Container(
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1)),
          color: textBoxBack,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //calling the _lefttopText function which is defined below
                      _lefttopText(a, context),

                      //calling the _leftbottomText function which is defined below
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //calling the _rightText function which is defined below
                      _rightText('Booth No: ' + b, context),
                      SizedBox(height: 10),
                      _rightText(c, context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _card(String a, String b, String c, String d, BuildContext context) {
  List address = [a, c];
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => resident(address: address),
        ));
      },
      child: Container(
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1)),
          color: textBoxBack,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //calling the _lefttopText function which is defined below
                      _lefttopText('No: ' + a, context),
                      SizedBox(height: 10),
                      //calling the _leftbottomText function which is defined below
                      _leftbottomText(b, context),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //calling the _rightText function which is defined below
                      _rightText('Booth No: ' + c, context),
                      SizedBox(height: 10),
                      _rightText(d, context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

//function to display the text on the top left of the card
Widget _lefttopText(String a, BuildContext context) {
  return Text(a,
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ));
}

//function to display the text on the right of the card
Widget _rightText(String a, BuildContext context) {
  return Text(
    a,
    style: TextStyle(
      fontSize: 20,
      letterSpacing: 1,
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.bold,
      color: text,
    ),
  );
}

////function to display the text on the bottom left of the card
Widget _leftbottomText(String a, BuildContext context) {
  return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        a,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ));
}

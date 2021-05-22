import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class adminConsole extends StatefulWidget {
  adminConsole({Key key}) : super(key: key);

  @override
  _adminConsoleState createState() => _adminConsoleState();
}

class _adminConsoleState extends State<adminConsole> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 130),
              child: Text(
                "Welcome Admin,",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans',
                    color: text),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    "Wall Feed",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProductSans',
                        color: text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 200),
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
                      // Have to add the view all wala list here to navifate
                      var Viewallroute;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewallroute),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: _WallFeedcard(context),
                    );
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 250),
                child: custom_button("New Post", context)),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Citizen Feed",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProductSans',
                        color: text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 180),
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
                      // Have to add the view all wala list here to navifate
                      var Viewallroute;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewallroute),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 225),
              child: Text(
                "Active Complaints",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans',
                    color: text),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: _Complaintcard(context),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 255),
              child: Text(
                "Download Data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans',
                    color: text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: custom_button("Download", context),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Volunteer Console",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProductSans',
                        color: text),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 120),
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
                      // Have to add the view all wala list here to navifate
                      var Viewallroute;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewallroute),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: custom_button("Add New Volunteer", context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _WallFeedcard(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 5, right: 5),
    child: GestureDetector(
      child: Container(
        child: Card(
          elevation: 1,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
                      _WallFeed("Title", context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _WallFeed(String title, BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 5, right: 20),
        child: Text(title,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 20),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Icon(Icons.favorite),
            ),
            Text("1000",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 20),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: SvgPicture.asset(
                'assets/icon/share.svg',
                color: Colors.black,
                width: 22,
              ),
            ),
            Text("10",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                )),
          ],
        ),
      ),
    ],
  );
}

Widget _Complaintcard(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 5, right: 5),
    child: GestureDetector(
      child: Container(
        child: Card(
          elevation: 1,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1)),
          color: textBoxBack,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ActiveComplaints("#21", context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _ActiveComplaints(String cNumber, BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 5, right: 20),
        child: Text(cNumber,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 20),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 7),
              child: Text("Booth No :",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text,
                  )),
            ),
            Text("1",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 20),
        child: Text("Title",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 20),
        child: Text("01/01/2021",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text,
            )),
      ),
    ],
  );
}

Widget custom_button(String s, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      var Viewallroute;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Viewallroute),
      );
    },
    child: Text(s, style: TextStyle(color: navIcon, fontFamily: 'ProductSans')),
    style: ElevatedButton.styleFrom(
        primary: submitGrey,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.010),
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.018,
          fontWeight: FontWeight.w600,
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        )),
  );
}

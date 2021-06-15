import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';

class adminConsole extends StatefulWidget {
  adminConsole({Key key}) : super(key: key);

  @override
  _adminConsoleState createState() => _adminConsoleState();
}

class _adminConsoleState extends State<adminConsole> {
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
                    "Welcome Admin,",
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
                        "Wall Feed",
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
                          var Viewallroute;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Viewallroute),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: _WallFeedcard(context),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: custom_button("New Post", context)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.only(top: 10, right: 15),
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
                          var Viewallroute;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Viewallroute),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        "Active Complaints",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans',
                            color: text),
                      ),
                    ),
                  ],
                ),
                Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        "Download Data",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans',
                            color: text),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: custom_button("Download", context),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.only(top: 10, right: 15),
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
                          var Viewallroute;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Viewallroute),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: custom_button("Add New Volunteer", context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _WallFeedcard(BuildContext context) {
  return GestureDetector(
    child: Container(
      child: Card(
        elevation: 1,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1)),
        color: textBoxBack,
        child: Padding(
          padding: EdgeInsets.all(5),
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
  );
}

Widget _WallFeed(String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(title,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold,
              color: text,
            )),
      ),
      Center(
          child: SizedBox(
        height: 10,
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite),
          SizedBox(
            width: 10,
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
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icon/share.svg',
            color: Colors.black,
            width: 22,
          ),
          SizedBox(
            width: 10,
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
    ],
  );
}

Widget _Complaintcard(BuildContext context) {
  return GestureDetector(
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
            mainAxisAlignment: MainAxisAlignment.center,
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
  );
}

Widget _ActiveComplaints(String cNumber, BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(cNumber,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                )),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Booth No :",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                color: text,
              )),
          SizedBox(
            width: 3,
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
      SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Title",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                color: text,
              )),
        ],
      ),
      SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("01/01/2021",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                color: text,
              )),
        ],
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

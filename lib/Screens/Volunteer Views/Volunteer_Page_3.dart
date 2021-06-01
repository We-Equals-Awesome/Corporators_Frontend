import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/colours.dart';
import 'Volunteer_Page_1.dart';
import 'Volunteer_Page_2.dart';

//page to display the members of the family whose details have been collected

class resident extends StatefulWidget {
  //address list to store the street and house number
  var address = new List();
  //sflag to check if the family member is head of family or a different member
  int sflag;
  //constructor of the resident class
  resident({this.address, this.sflag});

  @override
  _residentState createState() => _residentState(address, sflag);
}

class _residentState extends State<resident> {
  //address list to store the street and house number
  var address = new List();
  //sflag to check if the family member is head of family or a different member
  int sflag;
  //constructor of the _residentState class
  _residentState(this.address, this.sflag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'No. ' + address[0] + ', ' + address[1] + ' Street',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 22),
              child: Text(
                'Add Residents',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                ),
              ),
            ),
            //calling the relationName functioin which is defined below
            relationName('Head', context),
            Wrap(
              children: [
                //calling the relationName functioin which is defined below
                relationName('Father', context),
                relationName('Mother', context),
                relationName('Son', context),
                relationName('Daughter', context),
                relationName('Wife', context),
                relationName('Brother', context),
                relationName('Sister', context),
                relationName('Grand Father', context),
                relationName('Father-In-Law', context),
                relationName('Neice', context),
                SizedBox(
                  width: 90,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: IconButton(
                      onPressed: () {
                        sflag = 0;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              dataEntry(address: address, sflag: sflag),
                        ));
                      },
                      icon: Icon(
                        Icons.add_circle_rounded,
                        size: 35,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //to display the floating action button
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => viewAll()),
            );
          },
          label: Text(
            'View All',
            style: TextStyle(
              fontFamily: 'ProductSans',
              color: navIcon,
              fontSize: 14,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  //function to display the members of the family who are added into the database
  Widget relationName(String a, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.24,
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                size: 38,
              ),
            ),
            SizedBox(
              child: Text(
                a,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

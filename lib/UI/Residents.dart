import 'package:cropapp/UI/ViewAll.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'DataEntry.dart';

class resident extends StatefulWidget {
  var address = new List();
  int sflag;
  resident({this.address, this.sflag});

  @override
  _residentState createState() => _residentState(address, sflag);
}

class _residentState extends State<resident> {
  var address = new List();
  int sflag;
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
            relationName('Head', context),
            Wrap(
              children: [
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
                  width: 100,
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

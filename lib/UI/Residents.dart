import 'package:cropapp/UI/AddressPage.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'DataEntry.dart';

class resident extends StatefulWidget {
  @override
  _residentState createState() => _residentState();
}

class _residentState extends State<resident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                'No. X, Y Street(Booth B)',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Add Residents',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: text),
              ),
            ),
            relationName('Head', context),
            Row(
              children: [
                relationName('Father', context),
                relationName('Mother', context),
                relationName('Wife', context),
                relationName('Brother', context),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => dataEntry()),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_rounded,
                      size: 35,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            )
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
              MaterialPageRoute(builder: (context) => addressPage()),
            );
          },
          label: Text(
            'Next House',
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

  Widget relationName(String a, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 35,
              color: Colors.grey[800],
            ),
          ),
          Text(
            a,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

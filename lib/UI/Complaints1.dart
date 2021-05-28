import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

//page to display all the complaints that are registered with details like Complaint number, booth number and date.
class complaintList extends StatefulWidget {
  @override
  _complaintListState createState() => _complaintListState();
}

class _complaintListState extends State<complaintList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        //listview to display all the complaints in a card in a list format
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Complaints',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                  color: text,
                ),
              ),
            ),
            //_card function is called which is defined below
            _card('11', '151', '21/21/21', context),
            _card('23', '17', '20/21/2018', context),
            _card('12', '22', '21/21/21', context),
            _card('21', '20', '21/21/21', context),
            _card('11', '151', '21/21/21', context),
            _card('23', '17', '20/21/2018', context),
            _card('12', '22', '21/21/21', context),
            _card('21', '20', '21/21/21', context),
          ],
        ),
      ),
      //to display the floating action button
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            '?????',
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

  //function to display all the complaints and details in cards
  Widget _card(String a, String b, String c, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1),
          ),
          color: textBoxBack,
          child: Padding(
            padding: EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  //calling the function _leftText which is defined below
                  child: _leftText('#' + a, context),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //calling the function _rightText which is defined below
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
    );
  }

  //function to display how the text on the left must look like
  Widget _leftText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 36,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

  //function to display how the text on the right must look like
  Widget _rightText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }
}

import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Complaints',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            _card('11', '151', '21/21/21', context),
            _card('23', '17', '20/21/2018', context),
            _card('12', '22', '21/21/21', context),
            _card('21', '20', '21/21/21', context),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            '???',
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

  Widget _card(String a, String b, String c, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1)),
          color: textBoxBack,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 10),
            child: Row(children: [
              Expanded(
                child: _leftText('#' + a, context),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _rightText('Booth No: ' + b, context),
                      SizedBox(height: 10),
                      _rightText(c, context)
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _leftText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 36,
        letterSpacing: 1,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

  Widget _rightText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 24,
        letterSpacing: 1,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }
}

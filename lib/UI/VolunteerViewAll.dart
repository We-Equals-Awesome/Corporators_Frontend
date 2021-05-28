import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

//page to display all the volunteers who are registered into system
class volunteerList extends StatefulWidget {
  @override
  _volunteerListState createState() => _volunteerListState();
}

class _volunteerListState extends State<volunteerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ConstrainedBox(
        constraints: BoxConstraints.tight(MediaQuery.of(context).size),
        child: SafeArea(
          //listview to display all the complaints in a card in a list format
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  'Volunteers',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text,
                  ),
                ),
              ),
              //_card function is called which is defined below
              _card('11', 'abcdefgh', context),
              _card('23', 'abcd', context),
              _card('12', 'Hello World', context),
              _card('21', 'mnopqrst', context),
              _card('11', 'asdf ;lkj', context),
              _card('23', 'asdf ;lkj', context),
              _card('12', 'asdf ;lkj', context),
              _card('21', 'Hello World', context),
              _card('11', 'asdf ;lkj', context),
              _card('23', 'asdf ;lkj', context),
              _card('12', 'asdf ;lkj', context),
              _card('21', 'Hello World', context),
            ],
          ),
        ),
      ),
      //to display the floating action button
      floatingActionButton: SizedBox(
        width: 150,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add a volunteer',
              style: TextStyle(
                fontFamily: 'ProductSans',
                color: navIcon,
                fontSize: 14.0,
              ),
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  //function to display all the complaints and details in cards
  Widget _card(String a, String b, BuildContext context) {
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
                  child: _leftText('Booth: ' + a, context),
                ),
                Expanded(
                  //calling the function _rightText which is defined below
                  child: _rightText('Name: ' + b, context),
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
        fontSize: 26,
        fontFamily: 'ProductSans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

  //function to display how the text on the right must look like
  Widget _rightText(String a, BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          a,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.bold,
            color: text,
          ),
        ),
      ),
    );
  }
}

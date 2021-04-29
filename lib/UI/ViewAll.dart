import 'package:cropapp/UI/AddressPage.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'Residents.dart';

class viewAll extends StatefulWidget {
  @override
  _viewAllState createState() => _viewAllState();
}

class _viewAllState extends State<viewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                'Recently Added',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Product_Sans_Bold',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            _card('21', 'abcd', '15', '21/21/21', context),
            _card('123456789123456789', '5', 'abc', '21/21/21', context),
            _card('21', 'abcdefghijklmnopqrst', 'abc', '21/21/21', context),
            _card('21', 'a', 'abcdefghijklmnopqrst', '21/21/21', context),
            _card('21', '5', 'abc', '21/21/2121/21/2121/21/21', context),
            _card('21', 'abcd', '15', '21/21/21', context),
            _card('123456789123456789', '5', 'abc', '21/21/21', context),
            _card('21', 'abcdefghijklmnopqrst', 'abc', '21/21/21', context),
            _card('21', 'a', 'abcdefghijklmnopqrst', '21/21/21', context),
            _card('21', '5', 'abc', '21/21/2121/21/2121/21/21', context),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => addressPage(),
            ));
          },
          label: Text(
            'New Home',
            style: TextStyle(
              fontFamily: 'Product_Sans_Bold',
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
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
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1)),
          color: textBoxBack,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Row(children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _leftText('No: ', a, context),
                      SizedBox(height: 10),
                      _leftText('Name: ', b, context)
                    ]),
              ),
              SizedBox(width: 25),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _rightText('Booth No: ', c, context),
                      SizedBox(height: 10),
                      _rightText(d, '', context)
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _leftText(String a, String b, BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: a,
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontFamily: 'Product_Sans',
            fontWeight: FontWeight.bold,
            color: text,
          ),
        ),
        TextSpan(
          text: b,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontFamily: 'Product_Sans',
            fontWeight: FontWeight.bold,
            color: text,
          ),
        )
      ]),
    );
  }

  Widget _rightText(String a, String b, BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: a,
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 1,
            fontFamily: 'Product_Sans',
            fontWeight: FontWeight.bold,
            color: text,
          ),
        ),
        TextSpan(
          text: b,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontFamily: 'Product_Sans',
            fontWeight: FontWeight.bold,
            color: text,
          ),
        )
      ]),
    );
  }
}

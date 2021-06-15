import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsfeed_screen/Utils/color.dart';

//page to display the wall feed in the form of cards in a list

const share = 'assets/icons/share.svg';

class wallFeed extends StatefulWidget {
  @override
  _wallFeedState createState() => _wallFeedState();
}

class _wallFeedState extends State<wallFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Wall Feed',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            //calling the _card function which is defined below
            _card('Hello World', '23', '17', '15/05/21', context),
            _card('Hiiiiiiiiiiiiii', '56', '20', '06/08/2018', context),
            _card('Welcome Back', '89', '32', '21/21/21', context),
            _card('abcdefghijklmnop', '108', '123', '21/21/21', context),
            _card('Hello World', '23', '17', '15/05/21', context),
            _card('Hiiiiiiiiiiiiii', '56', '20', '06/08/2018', context),
            _card('Welcome Back', '89', '32', '21/21/21', context),
            _card('abcdefghijklmnop', '108', '123', '21/21/21', context),
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
            '???',
            style: TextStyle(
              fontFamily: 'ProductSans',
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  //function to display the Card
  Widget _card(String a, String b, String c, String d, BuildContext context) {
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
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  //calling the _leftText function which is defined below
                  child: _leftText(a, context),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            size: 35,
                            color: submitGrey,
                          ),
                          //calling the _rightText function which is defined below
                          _rightText(b, context),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 5),
                            child: SvgPicture.asset(share),
                          ),
                          //calling the _rightText function which is defined below
                          _rightText(c, context)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        //calling the _rightText function which is defined below
                        child: _rightText(d, context),
                      )
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

  //function to display the text on the left of the card
  Widget _leftText(String a, BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        a,
        style: TextStyle(
          fontSize: 25,
          letterSpacing: 1,
          fontFamily: 'ProductSans',
          fontWeight: FontWeight.bold,
          color: text,
        ),
      ),
    );
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

  //dynamic like button if necessary
  // Widget Favorite() {
  //   return IconButton(
  //       icon: Icon(
  //         Icons.favorite,
  //         color: (isPressed) ? Colors.red : Colors.grey,
  //       ),
  //       onPressed: () {
  //         if (flag == 1) {
  //           setState(() {
  //             isPressed = false;
  //             flag = 0;
  //             count = count - 1;
  //           });
  //         } else {
  //           setState(() {
  //             isPressed = true;
  //             flag = 1;
  //             count = count+1;
  //           });
  //         }
  //       });
  // }
}

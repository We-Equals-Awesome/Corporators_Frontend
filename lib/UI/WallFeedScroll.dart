import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                'Wall Feed',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    color: text),
              ),
            ),
            _card('abc', '23', '17', '15/05/21', context),
            _card('def', '56', '20', '06/08/2018', context),
            _card('ghi', '89', '32', '21/21/21', context),
            _card('abcdefghijklmnop', '108', '123', '21/21/21', context),
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
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

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
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Row(children: [
              Expanded(
                child: _leftText(a, context),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.favorite_rounded,
                                size: 35,
                                color: submitGrey,
                              ),
                              onPressed: () {}),
                          _rightText(b, context),
                          IconButton(
                              icon: Icon(
                                Icons.send_rounded,
                                size: 35,
                                color: submitGrey,
                              ),
                              onPressed: () {}),
                          _rightText(c, context)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: _rightText(d, context),
                      )
                    ]),
              ),
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
        fontSize: 25,
        letterSpacing: 1,
        fontFamily: 'Product_Sans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

  Widget _rightText(String a, BuildContext context) {
    return Text(
      a,
      style: TextStyle(
        fontSize: 20,
        letterSpacing: 1,
        fontFamily: 'Product_Sans',
        fontWeight: FontWeight.bold,
        color: text,
      ),
    );
  }

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

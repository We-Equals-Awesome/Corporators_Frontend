import 'package:flutter/material.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              _card('Pritam', '12', context),
              _card('Micheal Scott', '12', context),
              _card('Joey Tribbiani', '13', context),
            ],
          ),
        ),
      ),
    );
  }

  //function to display all the complaints and details in cards
  final SlidableController slidableController = SlidableController();
  Widget _card(String a, String b, BuildContext context) {
    return SlidableWidget(
      slidableController: slidableController,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(1500, 110)),
          child: GestureDetector(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 1),
              ),
              color: textBoxBack,
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //_text function is called which is defined below
                    _text('Name: ' + a, context),
                    _text('Booth No: #' + b, context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //function to display the text on the card
  Widget _text(String a, BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(
          a,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: text,
          ),
        ),
      ),
    );
  }
}

//Slidable Widget code
class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final SlidableController slidableController;

  const SlidableWidget({
    @required this.child,
    @required this.slidableController,
  });

  @override
  Widget build(BuildContext context) => Slidable(
        controller: slidableController,
        actionPane: SlidableBehindActionPane(),
        child: child,
        secondaryActions: <Widget>[
          IconSlideAction(
            color: background,
            iconWidget: Icon(
              Icons.call,
              size: 50,
              color: text,
            ),
            onTap: () {
              launch("tel://9493364308");
            },
          )
        ],
      );
}

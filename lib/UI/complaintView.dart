import 'package:flutter/material.dart';
import 'package:newsfeed_screen/UI/NewComplaint.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:newsfeed_screen/Utils/complaint.dart';
import 'package:newsfeed_screen/Utils/constant.dart';

class ComplaintsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        backgroundColor: background,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewComplaint(),
                //builder: (context) => ReadFeeds(news: trending),
              ),
            );
          },
          elevation: 2,
          backgroundColor: submitGrey,
          //icon: Icon(Icons.edit),
          label: Text(
            'New Complaint',
            style: TextStyle(color: background),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
                width: width,
                //height: 80,
                child: Text(
                  "Complaints",
                  style: headline1,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                width: width,
                //height: 80,
                child: Text(
                  "Recent Complaints",
                  style: headline2,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      //in this container we will display the Complaints
                      //as there should we styling in which complaint is displayed so all the styling is described in the complaintInfo() function
                      //and we call FeedView Function here
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),

                      child: ComplaintInfo(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ComplaintInfo extends StatefulWidget {
  @override
  _ComplaintInfoState createState() => _ComplaintInfoState();
}

class _ComplaintInfoState extends State<ComplaintInfo> {
  @override
  Widget build(BuildContext context) {
    //as there is n number of news so there will be n number of the FeedView card so here we will be using the ListView.Builder

    return ListView.builder(
      itemCount: complaintList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var totalComplaint = complaintList[index];

        //on taping any card user will be pushed to the new Page where they can read the news in the detail

        return Container(
            width: double.infinity,
            color: background,
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: ComplaintsCard(complaint: totalComplaint));

        // GestureDetector(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => NewComplaint(),
        //      //builder: (context) => ReadFeeds(news: trending),
        //     ),
        //   );
        // },
        // child: ComplaintsCard(),
        // );
      },
    );
  }
}

class ComplaintsCard extends StatefulWidget {
  final Complaint complaint;

  ComplaintsCard({this.complaint});

  @override
  _ComplaintsCardState createState() => _ComplaintsCardState();
}

class _ComplaintsCardState extends State<ComplaintsCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Container(
      height: 80,
      padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 5.0, bottom: 10.0),
      //box decoration of the card
      decoration: BoxDecoration(
          color: textBoxBack,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: blk, width: 1.0)),
      child: Row(
        children: [
          //Column(children: [Text("gh")],),
          Container(
            alignment: Alignment.centerLeft,
            width: width / 2.12,
            // height: ,
            child: Text(
              widget.complaint.title,
              style: headline1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        child: Text(
                      widget.complaint.time,
                      textAlign: TextAlign.left,
                      style: headlineSmall2,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        child: Text(
                      "Status: ",
                      style: headlineSmall2,
                    )),
                    Container(
                        child: Text(
                      widget.complaint.status,
                      style: headlineSmall2,
                    )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
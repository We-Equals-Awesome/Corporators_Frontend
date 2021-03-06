import 'package:Corporator_Mobile_App/Dummy_Data/Admin-complaint.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Admin_Complaints_2.dart';

class AdminComplaintview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        backgroundColor: background,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                width: width,
                //height: 80,
                child: Text(
                  "Complaints",
                  style: headline1,
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

                      child: AdminComplaintInfo(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class AdminComplaintInfo extends StatefulWidget {
  @override
  _AdminComplaintInfoState createState() => _AdminComplaintInfoState();
}

class _AdminComplaintInfoState extends State<AdminComplaintInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: complaintListfromadmin.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var totalComplaint = complaintListfromadmin[index];

        //on taping any card user will be pushed to the new Page where they can read the news in the detail

        return Container(
            width: double.infinity,
            color: background,
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            //child: AdminComplaintsCard(complaint: totalComplaint)
            //  );
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AdminComplaintAllot(adminComplaint: totalComplaint),
                    ),
                  );
                },
                child: AdminComplaintsCard(complaint: totalComplaint)));
      },
    );
  }
}

class AdminComplaintsCard extends StatefulWidget {
  final AdminComplaint complaint;

  AdminComplaintsCard({this.complaint});

  @override
  _AdminComplaintsCardState createState() => _AdminComplaintsCardState();
}

class _AdminComplaintsCardState extends State<AdminComplaintsCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Container(
      // height: 110,
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
      //box decoration of the card
      decoration: BoxDecoration(
          color: textBoxBack,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: blk, width: 1.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width / 2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.complaint.complaintNumber,
                      style: headline1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
              ),
              Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      "Booth No : " + widget.complaint.booth,
                      textAlign: TextAlign.left,
                      style: headlineSmall2,
                    )),
                    Container(
                        child: Text(
                      widget.complaint.time,
                      style: headlineSmall2,
                    )),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 7,),
          Row(
            children: [
              Container(
                width: width-100,
                child: Text(widget.complaint.title,
                  style: headlineSmall2.copyWith(fontSize: 22),
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

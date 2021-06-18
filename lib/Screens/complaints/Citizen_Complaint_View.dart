import 'package:Corporator_Mobile_App/Dummy_Data/complaint.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CitizenComplaintView extends StatefulWidget {
  final Complaintfromstatic citizenComplaint;

  CitizenComplaintView({this.citizenComplaint});

  @override
  _CitizenComplaintViewState createState() => _CitizenComplaintViewState();
}

class _CitizenComplaintViewState extends State<CitizenComplaintView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: ListView(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(60, 10, 5, 10),
                child: Text(
                  widget.citizenComplaint.time,
                  textAlign: TextAlign.right,
                  style: headlineSmall2,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text(
                  widget.citizenComplaint.title,
                  textAlign: TextAlign.left,
                  style: headlineSmall2.copyWith(fontSize: 25),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 20, 5, 15),
                child: Text(
                  widget.citizenComplaint.complaintDetail,
                  textAlign: TextAlign.left,
                  style: headlineSmall,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Status : ",
                      textAlign: TextAlign.left,
                      style: headlineSmall2.copyWith(fontSize: 20),
                    ),
                    Text(
                      widget.citizenComplaint.status,
                      textAlign: TextAlign.left,
                      style: headlineSmall2.copyWith(
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text(
                  "Details",
                  textAlign: TextAlign.left,
                  style: headlineSmall2,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                decoration: BoxDecoration(
                    color: entryBox,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blk, width: 1.0)),
                child: Text(
                  widget.citizenComplaint.userName,
                  style: textHint,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                decoration: BoxDecoration(
                    color: entryBox,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blk, width: 1.0)),
                child: Text(
                  widget.citizenComplaint.userNumber,
                  style: textHint,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text(
                  "Address",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                decoration: BoxDecoration(
                    color: entryBox,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blk, width: 1.0)),
                child: Text(
                  widget.citizenComplaint.address,
                  style: textHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

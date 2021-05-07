import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/Admin-complaint.dart';

class AdminComplaintAllot extends StatefulWidget {
  final AdminComplaint adminComplaint;
  AdminComplaintAllot({this.adminComplaint});

  @override
  _AdminComplaintAllotState createState() => _AdminComplaintAllotState();
}

class _AdminComplaintAllotState extends State<AdminComplaintAllot> {
  String valueChose1 ;
  String valueChose2 ;
  List listitems = ["Random Guy","Vishnu","Name1","Name2"];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(60, 10, 5, 10),
                child: Text(
                  widget.adminComplaint.time,
                  textAlign: TextAlign.right,
                  style: headlineSmall2,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  children: [
                    Container(
                      child: Text(widget.adminComplaint.complaintNumber,
                        textAlign: TextAlign.left,
                        style: headline1,
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(widget.adminComplaint.title,
                        textAlign: TextAlign.right,
                        style: headlineSmall2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 20, 5, 15),
                child: Text(widget.adminComplaint.complaintDetail,
                  textAlign: TextAlign.left,
                  style: headlineSmall,
                ),
              ),

              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text("Details",
                  textAlign: TextAlign.left,
                  style: headlineSmall2,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text("Name",
                  style: TextStyle(
                    fontFamily: 'ProductSans' ,
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
                child: Text(widget.adminComplaint.userName,
                  style: textHint,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text("Phone Number",
                  style: TextStyle(
                    fontFamily: 'ProductSans' ,
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
                child: Text(widget.adminComplaint.userNumber,
                  style: textHint,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text("Address",
                  style: TextStyle(
                    fontFamily: 'ProductSans' ,
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
                child: Text(widget.adminComplaint.address,
                  style: textHint,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Text("Volenteer's Alloted",
                  style: TextStyle(
                    fontFamily: 'ProductSans' ,
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width/2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blk, width: 1.0)),
                child: Center(
                  child: DropdownButton(
                    hint: Text("Select"),
                    dropdownColor: entryBox,
                    value: valueChose1,
                    icon: Icon(Icons.keyboard_arrow_down_sharp,
                    size: 30,),
                    underline: SizedBox(),

                    onChanged: (newValue1){
                      setState(() {
                        valueChose1 = newValue1;
                      });
                    },
                    items: listitems.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: width/2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blk, width: 1.0)),
                child: Center(
                  child: DropdownButton(
                    hint: Text("Select"),
                    dropdownColor: entryBox,
                    value: valueChose2,
                    icon: Icon(Icons.keyboard_arrow_down_sharp,
                      size: 30,),
                    underline: SizedBox(),

                    onChanged: (newValue){
                      setState(() {
                        valueChose2 = newValue;
                      });
                    },
                    items: listitems.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),

                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Completed",
          style: TextStyle(color: background, fontFamily: 'ProductSans'),
        ),
        elevation: 2,
        backgroundColor: submitGrey,
        onPressed: () {
          // if(valueChose1.isEmpty){
          //   print("volenteer 1 is null");
          // }
          print("Volenteer 1 name is = "+valueChose1);
          print("Volenteer 2 name is = "+valueChose2);
          Navigator.pop(context);
        },
      ),

    );



  }
}

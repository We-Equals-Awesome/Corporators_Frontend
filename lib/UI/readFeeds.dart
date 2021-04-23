import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:share/share.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ReadFeeds extends StatefulWidget {
  //creating the constructor of the ReedFeeds

  final News news;
  ReadFeeds({this.news});

  @override
  _ReadFeedsState createState() => _ReadFeedsState();
}

class _ReadFeedsState extends State<ReadFeeds> {

  int textFontSize = 20;
  double doubleConvert = 1.0;

  // var screenSize = MediaQuery.of(context).size;
  // var width = screenSize.width;
  // var height = screenSize.height;


  @override
  Widget build(BuildContext context) {

    //returning Scaffold

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        //bottom: false,
        //top: false,
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20,0,20,10),
            decoration: BoxDecoration(

              //Box decoration

                color: background, border: Border.all(color: blk, width: 1.0)),

              //displaying the detailed News in the Form of List
            child: ListView(
              children: [
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                    child: Row(
                      //top row of the Scaffold

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        //back button on the top
                        //Icon button to change the font size of description

                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/text-font.svg',
                            color: blk,
                            width: 30,
                          ),
                          onPressed: (){
                            setState(() {
                              if(textFontSize==20){
                                textFontSize=23;
                              }
                              else if(textFontSize==23){
                                textFontSize=26;
                              }
                              else {
                                textFontSize=20;
                              }
                            });
                          },
                        ),



                      ],
                    ),
                  ),
                ),

                //title of the News
                Text(widget.news.title,
                    style: titleCardhead),
                SizedBox(height: 15.0),
                Hero(
                  //Image of the news
                  tag: widget.news.image,
                  child: Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(widget.news.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  //content of the news
                  widget.news.content,
                  style: TextStyle(fontSize: textFontSize*doubleConvert
                      ,fontFamily: 'ProductSans' ,fontWeight: FontWeight.normal),),

                SizedBox(height: 15.0),
                Row(
                  children: [
                    //time of the news posted on
                    Text(widget.news.time, style: postDetail),
                    SizedBox(width: 5.0),
                    //SizedBox(width: 5.0),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  //Icons row
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 15.0,
                      ),
                    ),
                    Spacer(),
                    //
                    Status(
                      // calling the status function in which like is incremented when the user tap the like button
                      //display total number of the like obtain in the news
                      icon: Icons.favorite_border,
                      onChange: Icons.favorite,
                      total: widget.news.favorite,
                    ),
                    //Text((widget.news.favorite).toString(), style: detailContent),
                    //SizedBox(width: 20),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/share.svg',
                        color: blk,
                        width: 22,
                      ),

                      onPressed: () {
                        // sharing the title of the news and the subtitle of the news
                        Share.share ('TITLE ${"\n"}${widget.news.title}${"\n\n\n"}INFO ${"\n"}${widget.news.subtitle}');
                      },
                    ),
                    //total shared news
                    //Text((widget.news.share).toString(), style: detailContent),
                   // SizedBox(width: 20.0),
                    //Icon(Icons.more_vert, color: blk, size: 24.0),
                  ],
                ),
                //SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//defining the Status Function
//ike is incremented when the user tap the like button
//display total number of the like obtain in the news

class Status extends StatefulWidget {
  IconData icon;
  IconData onChange;
  int total;
  Status({this.icon, this.total, this.onChange});
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(widget.icon),
          color: blk,
          onPressed: () {
            setState(() {
              if (widget.icon == widget.onChange) {
                widget.icon = Icons.favorite_border;
                widget.total--;
              }
              else {
                widget.icon = widget.onChange;
                widget.total++;
              }
            });
          },
        ),

        //SizedBox(width: 1.0),
        Text((widget.total).toString(), style: detailContent),

      ],
    );
  }
}

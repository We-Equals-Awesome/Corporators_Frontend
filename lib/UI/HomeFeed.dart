import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/UI/readFeeds.dart';
import 'package:share/share.dart';
import 'package:newsfeed_screen/Utils/color.dart';

  // HomeFeed  Class

class HomeFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // returning the Scaffold

    return Scaffold(

        backgroundColor: background,

        // body is ListView as we display the news feed in form of the List

        body: ListView(
          children: <Widget>[
            Container(

              // in this container of the List view we have define the greeting which changes As per current time
              // time function in this seeks the current time from the system itself

              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Text(
                (() {
                  if (time(TimeOfDay(hour: 12, minute: 00)) >
                      time(TimeOfDay.now())) {
                    return "Good Morning,";
                  } else if (time(TimeOfDay(hour: 16, minute: 00)) >
                      time(TimeOfDay.now())) {
                    return "Good Afternoon,";
                  } else if (time(TimeOfDay(hour: 23, minute: 59)) >
                      time(TimeOfDay.now())) {
                    return "Good Evening,";
                  } else {
                    return "GOOD  NIGHT,";
                  }
                }()),
                style: headline1,
              textAlign: TextAlign.start,
              ),
            ),
            Container(

              //in this container we will display the News Feed
              //as there should we styling in which news is displayed so all the styling is described in the FeedView() function
              //and we call FeedView Function here

              padding:  EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: FeedsView(),
            ),
          ],
        )

    );
  }
}


//creating the FeedView
class FeedsView extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    //as there is n number of news so there will be n number of the FeedView card so here we will be using the ListView.Builder

    return ListView.builder(
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var trending = trendingList[index];

        //on taping any card user will be pushed to the new Page where they can read the news in the detail

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadFeeds(news: trending),
              ),
            );
          },

          child: Container(
            width: double.infinity,
            color: background,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

            //calling function primary card where the content and positioning of the card is defined

            child: PrimaryCard(news: trending),
          ),
        );
      },
    );
  }
}

// creating card design to display news feed preview

class PrimaryCard extends StatefulWidget {
  final News news;
  PrimaryCard({this.news});

  @override
  _PrimaryCardState createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  Widget build(BuildContext context) {

    //returning the container with the content of the card i.e. title , subtitle , like button , total like on post , share button ,
    return Container(
      padding:
      EdgeInsets.only(left: 10.0 , right: 10.0 , top: 20.0 , bottom: 15.0),
      //box decoration of the card
      decoration: BoxDecoration(
          color: textBoxBack,
          borderRadius: BorderRadius.circular(35.0),

      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //title of the news card or news
            widget.news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: titleCardhead,
          ),
          SizedBox(height: 20.0), // spacing
          Text(

            // subtitle of the news card or the news
            widget.news.subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: headlineSmall,
          ),
          SizedBox(height: 30.0),

          Row(

            // like button and the share button

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // calling the status function in which like is incremented when the user tap the like button
              //display total number of the like obtain in the news
              Status(
                icon: Icons.favorite_border,
                onChange: Icons.favorite,
                total: widget.news.favorite,
              ),
              SizedBox(width: 10),
              // defining the share button

              IconButton(
                icon: Icon(
                  Icons.send,
                  color: blk,
                  size: 24.0,
                ),
                onPressed: () {

                  // sharing the title of the news and the subtitle of the news
                  Share.share ('TITLE -----------${"\n"}${widget.news.title}${"\n\n\n"}INFO ----------- ${"\n"}${widget.news.subtitle}');

                },
              ),
              //Icon(Icons.send, color: blk, size: 24.0),
              SizedBox(width: 10),
              Icon(Icons.more_vert, color: blk, size: 24.0),
            ],
          )
        ],
      ),
    );
  }
}

//time function which seeks the current time from the system

int time(TimeOfDay timeOfDay) {
  var now = timeOfDay;
  int nowInMinutes = now.hour * 60 + now.minute;
  return nowInMinutes;
}

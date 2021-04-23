import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/UI/readFeeds.dart';
import 'package:share/share.dart';
import 'package:newsfeed_screen/Utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';


  // HomeFeed  Class

class HomeFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //seeking the size of the Screen
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    // returning the Scaffold

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 80),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 25, 5, 5),

            width: width,
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
                  return "Good Night,";
                }
              }()),
              style: headline1,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      backgroundColor: background,
        body:
        ListView(
          children: <Widget>[
            Container(
              //in this container we will display the News Feed
              //as there should we styling in which news is displayed so all the styling is described in the FeedView() function
              //and we call FeedView Function here
              padding:  EdgeInsets.fromLTRB(25, 5, 25, 5),
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

        return GestureDetector(


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
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),

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
  IconData fav = Icons.favorite_border;
  Widget build(BuildContext context) {

    //returning the container with the content of the card i.e. title , subtitle , like button , total like on post , share button ,
    return Container(
      padding:
      EdgeInsets.only(left: 10.0 , right: 5.0 , top: 25.0 , bottom: 0.0),
      //box decoration of the card
      decoration: BoxDecoration(
          color: textBoxBack,
          borderRadius: BorderRadius.circular(35.0),
          border: Border.all(color: blk, width: 1.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            //title of the news card or news
            widget.news.title,
            // overflow: TextOverflow.ellipsis,
            // maxLines: 2,
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
          SizedBox(height: 5.0),
          Row(
            // like button and the share button
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // calling the status function in which like is incremented when the user tap the like button
              //display total number of the like obtain in the news
              IconButton(
                icon: Icon(
                  fav,
                  color: Colors.black,
                  size: 24.0,
                ),
                onPressed: () {
                  setState(() {
                    if (fav == Icons.favorite_border) {
                      fav = Icons.favorite;
                    } else {
                      fav = Icons.favorite_border;
                    }
                  });
                },
              ),
              // defining the share button
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/UI/readFeeds.dart';



class HomeFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackbround,
        body: ListView(
          children: <Widget>[
            Material(
              color: appBackbround,
              elevation: 5.0,
              child: Container(
                height: 50,
                color: appBackbround,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                  child: Text(
                    (() {
                      if (time(TimeOfDay(hour: 12, minute: 00)) >
                          time(TimeOfDay.now())) {
                        return "GOOD MORNING";
                      } else if (time(TimeOfDay(hour: 16, minute: 00)) >
                          time(TimeOfDay.now())) {
                        return "GOOD AFTERNOON";
                      } else if (time(TimeOfDay(hour: 23, minute: 59)) >
                          time(TimeOfDay.now())) {
                        return "GOOD EVENING";
                      } else {
                        return "GOOD NIGHT";
                      }
                    }()),
                    style: headline1,
                  textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: FeedsView(),
            ),
          ],
        )

    );
  }
}


//creating news feed home page preview

class FeedsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var trending = trendingList[index];

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
            color: appBackbround,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
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
  IconData fav = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 20.0),
      decoration: BoxDecoration(
          color: newsBackground,
          borderRadius: BorderRadius.circular(35.0),
          border: Border.all(color: blk, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: titleCardhead,
          ),
          SizedBox(height: 20.0),
          Text(
            widget.news.subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: headlineSmall,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              SizedBox(width: 15.0),
              Icon(Icons.send, color: Colors.black, size: 24.0),
              SizedBox(width: 8.0),
              Icon(Icons.more_vert, color: Colors.black, size: 24.0),
            ],
          )
        ],
      ),
    );
  }
}

int time(TimeOfDay timeOfDay) {
  var now = timeOfDay;
  int nowInMinutes = now.hour * 60 + now.minute;
  return nowInMinutes;
}

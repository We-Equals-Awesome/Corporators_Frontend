import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/UI/readFeeds.dart';




class HomeFeed extends StatelessWidget {
  @override
    Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: appBackbround,
      body:
      ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: appBackbround,
            child: Text("GOOD MORNING",style: headline1,textAlign: TextAlign.center,),
          ),
          Container(

            child: feedsView(),
          ),
        ],
      )
    );
  }
}


//creating news feed home page preview

class feedsView extends StatelessWidget {
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
          child:

          Container(
            width: double.infinity,
            //height: 300.0,
            color: appBackbround,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child:
            //Container(),
            PrimaryCard(news: trending),
            // PrimaryCard(news: trending),
          ),
        );
      },
    );
  }
}

// creating card design to display news feed preview

class PrimaryCard extends StatelessWidget {
  final News news;
  PrimaryCard({this.news});

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
            news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: titleCardhead,
          ),
          SizedBox(height: 20.0),
          Text(
            news.subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: headlineSmall,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
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
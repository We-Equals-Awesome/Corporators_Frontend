import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/Utils/constant.dart';

class ReadFeeds extends StatelessWidget {
  final News news;
  ReadFeeds({this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackbround,

      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          decoration: BoxDecoration(
              color: appBackbround,
              border: Border.all(color: blk, width: 1.0)),
          child: ListView(

            children: [
              SizedBox(height: 12.0),
              Text(news.title, style: titleCard.copyWith(fontSize: 28.0)),
              SizedBox(height: 25.0),
              Hero(
                tag: news.seen,
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(news.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.0),
              Text(
                news.content,
                style: descriptionStyle,
              ),

              SizedBox(height: 15.0),
              Row(
                children: [
                  Text(news.time, style: detailContent),
                  SizedBox(width: 5.0),
                  SizedBox(
                    width: 10.0,
                    child: Divider(
                      color: blk,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    news.author,
                    style: detailContent.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 15.0,
                    ),

                  ),
                  Spacer(),
                  Status(
                    icon: Icons.send,
                    total: news.seen,
                  ),
                  SizedBox(width: 15.0),
                  Status(
                    icon: Icons.favorite_border,
                    total: news.favorite,
                  ),
                ],
              ),
              SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;
  Status({this.icon, this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: blk,

        ),
        SizedBox(width: 4.0),
        Text(total, style: detailContent),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/Utils/constant.dart';



class ReadFeeds extends StatefulWidget {
  final News news;
  ReadFeeds({this.news});

  @override
  _ReadFeedsState createState() => _ReadFeedsState();
}

class _ReadFeedsState extends State<ReadFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackbround,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          decoration: BoxDecoration(
              color: appBackbround, border: Border.all(color: blk, width: 1.0)),
          child: ListView(
            children: [
              SizedBox(height: 12.0),
              Text(widget.news.title,
                  style: titleCard.copyWith(fontSize: 28.0)),
              SizedBox(height: 25.0),
              Hero(
                tag: widget.news.seen,
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.news.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                widget.news.content,
                style: descriptionStyle,
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Text(widget.news.time, style: detailContent),
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
                    widget.news.author,
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
                  Row(
                    children: [
                      Icon(
                        Icons.send,
                        color: blk,
                      ),
                      SizedBox(width: 4.0),
                      Text((widget.news.seen).toString(), style: detailContent),
                    ],
                  ),
                  SizedBox(width: 15.0),
                  Status(
                    icon: Icons.favorite_border,
                    onChange: Icons.favorite,
                    total: widget.news.favorite,
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
              } else {
                widget.icon = widget.onChange;
                widget.total++;
              }
            });
          },
        ),
        SizedBox(width: 4.0),
        Text((widget.total).toString(), style: detailContent),
      ],
    );
  }
}

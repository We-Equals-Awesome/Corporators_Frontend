import 'package:flutter/material.dart';
import 'package:newsfeed_screen/Utils/news.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:share/share.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                    ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Share.share('check out my website https://example.com');
                    },
                  ),

                  // CircleButton(
                  //   icon: Icons.share,
                  //   onTap: () {
                  //     Share.share('check out my website https://instagram.com');
                  //   },
                  // ),

                  // CircleButton(
                  //   icon: Icons.favorite_border,
                  //   onTap: () {},
                  // ),

                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: appBackbround,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
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
                    style: detailContent.copyWith(color: blk),
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
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.send,
                  //       color: blk,
                  //     ),
                  //     SizedBox(width: 4.0),
                  //     Text((widget.news.seen).toString(), style: detailContent),
                  //   ],
                  // ),
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


// app bar circle button

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  CircleButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,

        ),
        child: Card(
          elevation: 1.0,
          color: newsBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),

          ),
          child: Icon(
            icon,
            color: blk,
            size: 15.0,
          ),
        ),
      ),
    );
  }
}


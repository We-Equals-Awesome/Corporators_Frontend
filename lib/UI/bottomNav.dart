import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsfeed_screen/UI/HomeFeed.dart';
import 'package:newsfeed_screen/UI/NotificationView.dart';
import 'package:newsfeed_screen/UI/ProfileView.dart';
import 'package:newsfeed_screen/Utils/constant.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

    // calling profiles
    static List<Widget> _bottomNavView = [
    NotificationView(),
    HomeFeed(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
        child: _bottomNavView.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: blk,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index
          );
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 1000),
          curve: Curves.ease);
        },


        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Notification'),
              icon: SvgPicture.asset('assets/alert-octagon.svg',width: 25,color: bottomNavIcon, ),
              activeColor: bottomNavIcon,
              inactiveColor: newsBackground,
          ),
          BottomNavyBarItem(
              title: Text('Home feed'),
              icon: SvgPicture.asset('assets/home.svg',width: 25,color: bottomNavIcon, ),
              activeColor: bottomNavIcon,
              inactiveColor: newsBackground,
          ),
          BottomNavyBarItem(
              title: Text('Profile'),
              icon: SvgPicture.asset('assets/user.svg',width: 25,color: bottomNavIcon, ),
              activeColor: bottomNavIcon,
              inactiveColor: newsBackground,
          ),
        ],
      ),
    );
  }
}

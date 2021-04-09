import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsfeed_screen/UI/HomeFeed.dart';
import 'package:newsfeed_screen/UI/NotificationView.dart';
import 'package:newsfeed_screen/UI/ProfileView.dart';
import 'package:newsfeed_screen/Utils/constant.dart';



class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavView = [
    // calling profiles
    NotificationView(),
    HomeFeed(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackbround,
      body: SafeArea(
        child: _bottomNavView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: blk,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: _navBarList,
      ),
    );
  }
}

List<BottomNavigationBarItem> _navBarList = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/alert.svg',
      width: 30,
      color: bottomNavIcon,

    ),

    activeIcon: SvgPicture.asset(
      'assets/alert_1.svg',
      width: 30,
      color: bottomNavIcon,
    ),
    label: "Search",
  ),
 new BottomNavigationBarItem(
    icon: new SvgPicture.asset('assets/home.svg',
      width: 30,
      color: bottomNavIcon,
    ),
    activeIcon: SvgPicture.asset(
      'assets/home_2.svg',
      width: 30,
      color: bottomNavIcon,
    ),
    label: "Home",
  ),

  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/account.svg',
      width: 30,
      color: bottomNavIcon,
    ),
    activeIcon: SvgPicture.asset(
      'assets/account_2.svg',
      width: 30,
      color: bottomNavIcon,
    ),
    label: "Account",
  ),
];

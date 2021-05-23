import 'package:cropapp/Screens/HomePage.dart';
import 'package:cropapp/Screens/ProfileView.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cropapp/Screens/complaints/complaint_page2.dart';
import 'package:geocoder/geocoder.dart';

// creating the stateful  of BottomNav( Bottom Navigation Bar)

class Navigation_Bar extends StatefulWidget {
  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  //initializing the variable current index   and   pageControler
  //Default index is 1 so when the app start it will display the News Feed(HomeFeed)  page as a default selection

  int _currentIndex = 1;
  PageController _pageController;

  //Creating the object of the page controller class to initiate and dispose the page

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

  // creating list of profiles view  for Bottom Navigation Bar
  //index of Notification is 0 , HomeFeed is 1 , Profile is 2

  static List<Widget> _bottomNavView = [
    ComplaintsPage2(Coordinates(0, 0), 0),
    HomeFeed(),
    Profile_View(),
  ];

  @override
  Widget build(BuildContext context) {
    //returning the Scaffold which contains the Bottom Navigation Bar And Profile View in Body

    return Scaffold(
      backgroundColor: background,

      //profile view as per the Index of the Bottom Navigation Bar

      body: _bottomNavView.elementAt(_currentIndex),

      // Bottom Navigation Bar

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: navBarBackground,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 1000), curve: Curves.ease);
        },

        //items of the bottom navigation bar  -> i.e Complaints , News Feed , Profile
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Center(child: Text('Complaints')),
            icon: SvgPicture.asset(
              'assets/icons/alert-octagon.svg',
              width: 25,
              color: navIcon,
            ),
            activeColor: navIcon,
            inactiveColor: navBarSelectedGrey,
          ),
          BottomNavyBarItem(
            title: Center(child: Text('News Feed')),
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 25,
              color: navIcon,
            ),
            activeColor: navIcon,
            inactiveColor: navBarSelectedGrey,
          ),
          BottomNavyBarItem(
            title: Center(child: Text('Login')),
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              width: 25,
              color: navIcon,
            ),
            activeColor: navIcon,
            inactiveColor: navBarSelectedGrey,
          ),
        ],
      ),
    );
  }
}

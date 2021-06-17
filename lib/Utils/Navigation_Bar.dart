import 'package:Corporator_Mobile_App/Screens/complaints/Citizen_Complaints_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../Screens/Login and Signup/Login_Page_1.dart';
import '../Screens/User/Home_Page.dart';
import 'Colors.dart';

// creating the stateful  of BottomNav( Bottom Navigation Bar)

class Navigation_Bar extends StatefulWidget {
  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  // creating list of profiles view  for Bottom Navigation Bar
  //index of Notification is 0 , HomeFeed is 1 , Profile is 2
  //Default index is 1 so when the app start it will display the News Feed(HomeFeed)  page as a default selection
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    //returning the Scaffold which contains the Bottom Navigation Bar And Profile View in Body

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: navBarBackground,
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        //borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: navBarBackground,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    /*
    Complaints page takes two parameters in its constructor. The Coordinates are used
    to set the initial coordinates in the map.
    0 inidcated that no location has been selected by the user yet
    */
    ComplaintsView(),
    HomeFeed(),
    /*
       *  Value 0 is passed to MyhomePage.
       *  This value is used to decide whether or not to show the ALterDialogue box in login page.
       *  When the user opens the app then the AlterDialogue is not shown
       *  When the user is redirected to the Login page from the 'EnterYourDetailsPage',
       *   then the AlterDialogue Box is  shown.
       */
    LoginPage1(0),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      title: ('Complaints'),
      icon: SvgPicture.asset(
        'assets/icons/alert-octagon.svg',
        width: 45,
        color: navIcon,
      ),
      activeColorPrimary: navIcon,
      inactiveColorPrimary: navBarSelectedGrey,
    ),
    PersistentBottomNavBarItem(
      title: ('News Feed'),
      textStyle: TextStyle(fontSize: 23),
      icon: SvgPicture.asset(
        'assets/icons/home.svg',
        width: 25,
        color: navIcon,
      ),
      activeColorPrimary: navIcon,
      inactiveColorPrimary: navBarSelectedGrey,
    ),
    PersistentBottomNavBarItem(
      title: ('Login'),
      icon: SvgPicture.asset(
        'assets/icons/user.svg',
        width: 25,
        color: navIcon,
      ),
      activeColorPrimary: navIcon,
      inactiveColorPrimary: navBarSelectedGrey,
    ),
  ];
}

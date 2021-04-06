import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;

  //this is the navigation bar which is not been programmed completely yet
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          // _pageController.animateToPage(index,
          //duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.orange,
            ),
            title: Text(
              '...',
              style: TextStyle(color: Colors.orange),
            ),
            activeColor: Colors.grey[700],
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.orange),
            ),
            activeColor: Colors.grey[700],
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.orange,
            ),
            title: Text(
              'Volunteer',
              style: TextStyle(color: Colors.orange),
            ),
            activeColor: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}

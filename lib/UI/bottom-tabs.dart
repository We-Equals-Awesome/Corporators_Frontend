import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedTab, this.tabPressed});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 1;
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        decoration: BoxDecoration(
            color: Color(0XFF151515),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 30.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabBtn(
              iconPath: Icons.timer,
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.home_outlined,
              selected: _selectedTab == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.person_outline,
              selected: _selectedTab == 2 ? true : false,
              onPressed: () {
                widget.tabPressed(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconPath;
  final bool selected;
  final Function onPressed;
  BottomTabBtn({this.iconPath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        decoration: _selected
            ? BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50.0),
        )
            : null,
        child: _selected
            ? Row(
          children: [
            Icon(
              iconPath,
              size: 22.0,
              color: _selected ? Colors.yellow : Colors.yellow,
            ),
            Text(
              'Home Button',
              style: TextStyle(color: Colors.yellow),
            )
          ],
        )
            : Icon(
          iconPath,
          size: 22.0,
          color: _selected ? Colors.yellow : Colors.yellow,
        ),
      ),
    );
  }
}

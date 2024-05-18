import 'package:flutter/material.dart';
import 'package:yus_dev/pages/home.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _SelectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
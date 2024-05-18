import 'package:flutter/material.dart';
import 'package:yus_dev/pages/home.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Profile',
    ),
    Text(
      'Paramètres',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: const IconThemeData(size: 30, applyTextScaling: true),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Colors.yellow[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
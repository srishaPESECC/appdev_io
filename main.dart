import 'package:flutter/material.dart';
import 'package:social_app/home.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static const List<IconData> _bottomNavBarImages = [
    Icons.home,
    Icons.add,
    Icons.person_outline,
  ];

  static const List<String> _bottomNavBarTitles = [
    'Home',
    'Upload',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildScreen(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _bottomNavBarImages.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              _bottomNavBarImages[index],
              size: 25,
              color: Colors.grey,
            ),
            label: _bottomNavBarTitles[index],
          ),
        ),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return Container();
      case 2:
        return Container();
      default:
        return HomeScreen();
    }
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Social App',
    debugShowCheckedModeBanner: false,
    home: MainApp(),
    theme: ThemeData(
      fontFamily: 'Poppins',
      splashColor: Colors.transparent,
    ),
  ));
}

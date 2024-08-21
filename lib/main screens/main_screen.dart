// lib/main%20screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:gobin/main%20screens/dashboard.dart';
import 'package:gobin/main%20screens/learn.dart';
import 'package:gobin/main%20screens/map-to-bin.dart';
import 'package:gobin/main%20screens/recycle_stats.dart';
import 'package:gobin/main%20screens/scan_waste.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:gobin/ReusableComponents/standardAppBar.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    MapToBin(),
    LearnMore(),
    RecycleStats()
  ];

  final List<String> _titles = ['GoBin', 'Find Bins', 'Learn', 'Stats'];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.08),
        child: StandardAppBar(
          onIconPressed: () => Navigator.pushNamed(context, '/settings'),
          titleText: _titles[_currentIndex],
        ),
      ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.dashboard,
          Icons.directions,
          Icons.book,
          Icons.query_stats
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: _onTabTapped,
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
    );
  }
}

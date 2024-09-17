import 'package:flutter/material.dart';
import 'package:socialswirl/home_screen.dart';

import '../Services.dart';
import 'custom_page_route.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 4), // Offset from the bottom
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue, // Color when selected
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer_sharp),
            label: 'Remote Jobs',
            backgroundColor: Colors.blue, // Color when selected
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
            label: 'Services',
            backgroundColor: Colors.blue, // Color when selected
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_sharp),
            label: 'E - Learning',
            backgroundColor: Colors.blue, // Color when selected
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
            backgroundColor: Colors.blue, // Color when selected
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(HomeScreen(), AnimationType.leftToRight));
              break;
            case 1:

              break;
            case 2:
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ServicesPage(), AnimationType.bottomToTop));
              break;
            case 3:

              break;
          }
        },
      ),
    );
  }
}

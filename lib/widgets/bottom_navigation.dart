import 'package:flutter/material.dart';
import 'package:socialswirl/home_screen.dart';
import '../E learning.dart';
import '../Remote Jobs.dart';
import '../Services.dart';
import '../about us.dart';
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
            icon: Icon(Icons.settings_remote_sharp),
            label: 'Remote Jobs',
            backgroundColor: Colors.blue, // Color when selected
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_sharp),
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

          try {
            switch (index) {
              case 0:
                Navigator.of(context).push(
                  AnimatedPageRoute.getAnimatedPageRoute(HomeScreen(), AnimationType.leftToRight),
                );
                break;
              case 1:
                Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(RemoteJobs(),AnimationType.fade),);
                break;
              case 2:
                Navigator.of(context).push(
                  AnimatedPageRoute.getAnimatedPageRoute(ServicesPage(), AnimationType.bottomToTop),
                );
                break;
              case 3:
                Navigator.of(context).push(
                  AnimatedPageRoute.getAnimatedPageRoute(Elearning(), AnimationType.leftToRight),
                );
                break;
              case 4:
                Navigator.of(context).push(
                  AnimatedPageRoute.getAnimatedPageRoute(AboutUsPage(), AnimationType.scale),
                );
                break;
              default:
                throw Exception('Invalid index $index');
            }
          } catch (e) {
            // Show a SnackBar or Dialog with the error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error occurred: $e'),
                backgroundColor: Colors.red,
              ),
            );
            // Optionally, log the error for debugging
            print('Navigation error: $e');
          }
        },
      ),
    );
  }
}

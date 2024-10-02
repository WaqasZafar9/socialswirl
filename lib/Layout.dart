import 'package:flutter/material.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'E learning.dart';
import 'Remote Jobs.dart';
import 'Services.dart';
import 'about us.dart';
import 'home_screen.dart';


class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),       // Index 0
    RemoteJobs(),       // Index 1
    ServicesPage(),     // Index 2
    Elearning(),        // Index 3
    AboutUsPage(),      // Index 4
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu_open_outlined, size: 32),
        ),
        backgroundColor: const Color(0xFFE3F1FC),
        title: Text(
          'Social Swirl',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = 0; // Set Home tab active when logo button is pressed
              });
            },
            icon: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
          ),
        ],
      ),
      drawer: SocialSwirlsDrawer(),
      body: _pages[_currentIndex], // Display the selected page based on the index
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex, // Active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update active index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote_sharp),
            label: 'Remote Jobs',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_sharp),
            label: 'Services',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_sharp),
            label: 'E - Learning',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

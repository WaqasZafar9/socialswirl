import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/bottom_navigation.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'Remote Jobs.dart';
import 'Services.dart';
import 'about us.dart';
import 'home_screen.dart';

class Elearning extends StatefulWidget {
  const Elearning({super.key});

  @override
  State<Elearning> createState() => _ElearningState();
}

class _ElearningState extends State<Elearning> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coming Soon',
              style: GoogleFonts.poppins(
                color: Colors.lightBlueAccent,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
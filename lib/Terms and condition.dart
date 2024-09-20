import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'home_screen.dart';

class Termsandcondition extends StatefulWidget {
  const Termsandcondition({super.key});

  @override
  State<Termsandcondition> createState() => _TermsandconditionState();
}

class _TermsandconditionState extends State<Termsandcondition> {
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
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(
                  HomeScreen(), AnimationType.topToBottom));
            },
            icon: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
          ),
        ],
      ),
      drawer: SocialSwirlsDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Terms and Conditions',
                style: GoogleFonts.poppins(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              const SizedBox(height: 20,),
              Text('Welcome to Social Swirl. These Terms and Conditions govern your use of our website and services. By accessing or using Social Swirl, you agree to comply with and be bound by these terms. Our Terms and Conditions cover important aspects such as user responsibilities, intellectual property rights, limitations of liability, and dispute resolution procedures. We encourage you to read these terms carefully to understand your rights and obligations. If you do not agree with any part of these terms, please refrain from using our website and services. Your continued use constitutes acceptance of these terms.',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'home_screen.dart';

class Privacypolicy extends StatefulWidget {
  const Privacypolicy({super.key});

  @override
  State<Privacypolicy> createState() => _PrivacypolicyState();
}

class _PrivacypolicyState extends State<Privacypolicy> {
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
              Text('PRIVACY POLICY',
              style: GoogleFonts.poppins(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              const SizedBox(height: 20,),
              Text('At Social Swirl, we are committed to protecting your privacy and ensuring the security of your personal information. Our Privacy Policy outlines how we collect, use, and safeguard your data when you interact with our website and services. We adhere to industry standards and comply with legal requirements to guarantee your information is handled responsibly. By using our services, you consent to the data practices described in this policy. Your trust is important to us, and we continuously strive to maintain the highest standards of data privacy.',
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

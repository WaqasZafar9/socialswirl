import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/bottom_navigation.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'ContactUs.dart';
import 'E learning.dart';
import 'Remote Jobs.dart';
import 'Services.dart';
import 'home_screen.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200, // Adjust height as needed
            decoration: const BoxDecoration(
              color: Color(0xFFE3F1FC),
            ),
            child: Image.asset(
              'assets/About Us Banner.jpg',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 200,
            ),
          ),
          // First Section: Text Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'From Where We Start',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Social Swift, founded by Danial Khan in 2022, is a dynamic '
                      'software company based in the United Kingdom. Specializing in '
                      'innovative software and media solutions, we focus on new '
                      'creations to help businesses and individuals optimize their '
                      'online presence and achieve their goals.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Our mission is to provide high-quality, personalized, reliable, '
                      'and affordable services. With an experienced team dedicated to '
                      'excellence, we aim to build lasting client relationships based on '
                      'trust, transparency, and open communication.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),

          // Second Section: Image Section with Shadow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipOval(
              child: Image.asset(
                'assets/Social_Swirl_Logo_about_us.png',
                height: 300, // Adjusted height
                width: 300, // Adjusted width
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Third Section: Message From CEO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Message From CEO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'The company\'s mission is to provide high-quality software solutions '
                      'and media that help business and individuals optimize their online '
                      'presence and achieve their goals. With a team of experienced '
                      'professionals and a commitment to excellence, Social Swift is dedicated '
                      'to providing personalized, reliable, and affordable services to its clients. '
                      'Our mission is to provide high-quality software solutions and media services '
                      'that help businesses and individuals optimize their online presence and '
                      'achieve their goals.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/About Us Logo.png',
                  height: 350, // Made the image larger
                  width: 350,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            color: const Color(0xFF57A5F9), // Background color
            padding: const EdgeInsets.symmetric(
                vertical: 40.0, horizontal: 20.0), // Padding inside the container
            child: Column(
              mainAxisSize: MainAxisSize.min, // Keep column compact
              mainAxisAlignment: MainAxisAlignment.center, // Center content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Start a Project with us Today',
                  style: GoogleFonts.poppins(
                    color: Colors.white, // Title color
                    fontSize: 24.0, // Title font size
                    fontWeight: FontWeight.bold, // Title font weight
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10), // Spacing between title and subtitle
                // Subtitle/Paragraph
                Text(
                  'Call us now to schedule an online appointment and get your project successfully completed.',
                  style: GoogleFonts.poppins(
                    color: Colors.white, // Subtitle color
                    fontSize: 16.0, // Subtitle font size
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20), // Spacing between subtitle and button
                // Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ContactFormPage(), AnimationType.scale));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4196f2), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0), // Button padding
                    elevation: 8, // Add elevation for shadow effect
                    shadowColor:
                    Colors.black.withOpacity(0.5), // Set shadow color and opacity
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8), // Optional: Rounded corners
                    ),
                  ),
                  child: Text(
                    'Getting Started',
                    style: GoogleFonts.poppins(
                      color: Colors.white, // Button text color
                      fontSize: 16.0, // Button text font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

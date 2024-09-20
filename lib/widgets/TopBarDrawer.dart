import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialswirl/ContactUs.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Privacy Policy.dart';
import '../Terms and condition.dart';
import '../home_screen.dart';

final selectedMenuItemProvider = StateProvider<String>((ref) => 'Home');

class SocialSwirlsDrawer extends ConsumerWidget {
  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenuItem = ref.watch(selectedMenuItemProvider);

    return Drawer(
      child: SafeArea(
        child: Container(
          color: Color(0xFFF0F9FB),
          child: Column(
            children: <Widget>[
              // Blue top container with shadow
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Circular image with shadow
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.jpeg'),
                            radius: 35,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'SocialSwirls',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _buildMenuItem(
                        context, ref, 'Home', Icons.home, selectedMenuItem),
                    _buildMenuItem(context, ref, 'Remote Jobs', Icons.work,
                        selectedMenuItem),
                    _buildMenuItem(context, ref, 'Contact Us',
                        Icons.contact_mail, selectedMenuItem),
                    _buildMenuItem(context, ref, 'Licensing', Icons.verified,
                        selectedMenuItem),
                    _buildMenuItem(context, ref, 'Privacy Policy',
                        Icons.privacy_tip, selectedMenuItem),
                    _buildMenuItem(context, ref, 'Terms & Conditions',
                        Icons.description, selectedMenuItem),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/company/social-swirl.co/');
                    },
                    icon: Image.asset(
                      'assets/linkedin.png',
                      width: 38,
                      height: 38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://socialswirl.tech/');
                    },
                    icon: Image.asset(
                      'assets/twitter.png',
                      width: 38,
                      height: 38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://www.facebook.com/socialswirl.org');
                    },
                    icon: Image.asset(
                      'assets/facebook.png',
                      width: 38,
                      height: 38,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '© 2023 All Right Reserved',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, WidgetRef ref, String title,
      IconData icon, String selectedMenuItem) {
    final isSelected = selectedMenuItem == title;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.blue : Colors.grey[600]),
      ),
      tileColor: isSelected ? Colors.blue.withOpacity(0.1) : null,
      onTap: () {
        ref.read(selectedMenuItemProvider.notifier).state = title;
        Navigator.pop(context); // Close the drawer
        switch (title) {
          case 'Home':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 'Remote Jobs':
            break;
          case 'Contact Us':
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ContactFormPage(), AnimationType.fade),);
          case 'Terms & Conditions':
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(Termsandcondition(), AnimationType.fade),);
          case 'Licensing':
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(Privacypolicy(), AnimationType.fade),);
        }
      },
    );
  }
}

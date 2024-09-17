import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';

import 'home_screen.dart';

// Providers
final nameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final messageProvider = StateProvider<String>((ref) => '');

class ContactFormPage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

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
          style: textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(HomeScreen(),AnimationType.topToBottom));
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
        child: FutureBuilder(
          future: Future.delayed(Duration(milliseconds: 300)),
          builder: (context, snapshot) {
            return AnimatedOpacity(
              opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the form vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min, // Ensures the column takes only the required space
                      children: [
                        Text(
                          'Get in touch',
                          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "We'd love to hear from you! Please fill out the form below.",
                          style: textTheme.bodyMedium,
                        ),
                        SizedBox(height: 24),
                        CustomTextField(
                          label: 'Full name',
                          onChanged: (value) => ref.read(nameProvider.notifier).state = value,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          label: 'Email',
                          onChanged: (value) => ref.read(emailProvider.notifier).state = value,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          label: 'Message',
                          maxLines: 3,
                          onChanged: (value) => ref.read(messageProvider.notifier).state = value,
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle form submission
                              print('Name: ${ref.read(nameProvider)}');
                              print('Email: ${ref.read(emailProvider)}');
                              print('Message: ${ref.read(messageProvider)}');
                            },
                            child: Text('Submit', style: textTheme.labelLarge?.copyWith(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final ValueChanged<String> onChanged;

  CustomTextField({
    required this.label,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        maxLines: maxLines,
        style: textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: textTheme.bodyMedium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

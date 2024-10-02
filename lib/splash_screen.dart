import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimationComplete = false; // State variable for animation completion

  @override
  void initState() {
    super.initState();
    _runSplashAnimation();
  }

  // Method to run the splash animation and navigate to home screen after completion
  Future<void> _runSplashAnimation() async {
    try {
      // Play the Lottie animation for a set duration
      await Future.delayed(Duration(seconds: 8));
      setState(() {
        _isAnimationComplete = true; // Mark animation as complete
      });
      // Simulate additional loading if necessary
      await Future.delayed(Duration(seconds: 2)); // Adjust as needed
      Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      _showErrorDialog(error);
    }
  }

  // Method to show an error dialog
  void _showErrorDialog(Object error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred: $error'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isAnimationComplete
            ? CircularProgressIndicator() // Show loading indicator after animation completes
            : Lottie.asset('assets/splashscreen.json'), // Show the Lottie animation first
      ),
    );
  }
}

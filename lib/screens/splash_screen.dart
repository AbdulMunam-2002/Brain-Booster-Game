import 'package:flutter/material.dart';
import 'start_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to StartScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartScreen()),
      );
    });

    return Scaffold(
      body: Container(
       // color: Colors.blueAccent, // Set your desired background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the app logo
              Image.asset(
                'assets/images/logo.png',
                width: 150, // Adjust the size as needed
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'Brain Booster',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 43, 70), // Text color for contrast
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

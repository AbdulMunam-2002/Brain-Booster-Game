import 'package:flutter/material.dart';
import 'game_selection_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg3.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align items from the top
            children: [
              Spacer(flex: 7), // Creates space for 70% of the height
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameSelectionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 20),
                ),
                child: const Text('Start'),
              ),
              Spacer(flex: 3), // Optional: Adjust if you need more space below the button
            ],
          ),
        ),
      ),
    );
  }
}

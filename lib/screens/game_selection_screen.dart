import 'package:flutter/material.dart';
import '../games/grid_total_challenge/grid_total_challenge.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg5.jpeg', // Replace with your image path
              fit: BoxFit.cover, // Adjust image fit as needed
            ),
          ),
          // Content over the background image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Choose a Game to Play',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 44, 71),
                  ),
                ),
                const SizedBox(height: 30),
                GameButton(
                  gameName: 'Grid Total Challenge',
                  onTap: () {
                    // Navigate to Grid Total Challenge game screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridTotalChallenge()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                GameButton(
                  gameName: 'Game 2 (Coming Soon)',
                  onTap: () {
                    // Placeholder for the second game
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Coming Soon'),
                          content: const Text('This game will be available soon.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String gameName;
  final VoidCallback onTap;

  const GameButton({required this.gameName, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      child: Text(
        gameName,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 51, 84), // Set the text color to white
        ),
      ),
    );
  }
}

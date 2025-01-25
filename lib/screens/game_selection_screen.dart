import 'package:flutter/material.dart';
import '../games/grid_total_challenge/grid_total_challenge.dart';
import '../games/block_the_way/block_the_way.dart'; // Import BlockTheWay game

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose a Game to Play',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg5.jpeg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Content over the background image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                GameButton(
                  gameName: 'Grid Total Challenge',
                  onTap: () {
                    // Navigate to Grid Total Challenge game screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GridTotalChallenge(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                GameButton(
                  gameName: 'Block the Way',
                  onTap: () {
                    // Navigate to Block the Way game screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlockTheWayGame(), // Use BlockTheWay widget
                      ),
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
          color: Color.fromARGB(255, 11, 51, 84),
        ),
      ),
    );
  }
}

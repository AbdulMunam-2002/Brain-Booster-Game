import 'package:flutter/material.dart';

class BlockTheWayGame extends StatefulWidget {
  const BlockTheWayGame({super.key});

  @override
  _BlockTheWayGameState createState() => _BlockTheWayGameState();
}

class _BlockTheWayGameState extends State<BlockTheWayGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Block the Way",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent, // Transparent app bar
        centerTitle: true, // Centered title
      ),
      body: Center(
        child: const Text(
          "Game content goes here!",
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "How to Play",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "1. Move along the path to block your opponent.\n"
                      "2. Use strategy to trap the opponent with no moves left.\n"
                      "3. The player who traps the other wins the game!\n"
                      "4. Tap on paths to select them.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tip: Plan your moves ahead to corner the opponent.",
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlockTheWayGame(),
  ));
}

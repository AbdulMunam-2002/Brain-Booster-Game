import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const GridTotalChallenge());
}

class GridTotalChallenge extends StatelessWidget {
  const GridTotalChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final int gridSize = 6; // Fixed grid size
  late List<List<int>> grid;
  late List<int> rowTargets;
  late List<int> colTargets;
  late List<List<bool>> selectedCells;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    initializeGrid();
  }

  void initializeGrid() {
    // Initialize the grid with random numbers between 1 and 10
    grid = List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => random.nextInt(10) + 1),
    );

    // Ensure targets are consistent for rows and columns
    selectedCells = List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => false),
    );

    calculateConsistentTargets();
  }

  void calculateConsistentTargets() {
    // Initialize row and column sums
    rowTargets = List.filled(gridSize, 0);
    colTargets = List.filled(gridSize, 0);

    // Randomly select subsets of cells to calculate targets (but don't preselect)
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (random.nextBool()) {
          rowTargets[row] += grid[row][col];
          colTargets[col] += grid[row][col];
        }
      }
    }
  }

  void onCellTapped(int row, int col) {
    setState(() {
      selectedCells[row][col] = !selectedCells[row][col];
      if (isGameCompleted()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Congratulations!"),
              content: const Text("You have successfully completed the game."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  bool isRowSatisfied(int row) {
    int sum = 0;
    for (int col = 0; col < gridSize; col++) {
      if (selectedCells[row][col]) {
        sum += grid[row][col];
      }
    }
    return sum == rowTargets[row];
  }

  bool isColumnSatisfied(int col) {
    int sum = 0;
    for (int row = 0; row < gridSize; row++) {
      if (selectedCells[row][col]) {
        sum += grid[row][col];
      }
    }
    return sum == colTargets[col];
  }

  bool isGameCompleted() {
    for (int row = 0; row < gridSize; row++) {
      if (!isRowSatisfied(row)) return false;
    }
    for (int col = 0; col < gridSize; col++) {
      if (!isColumnSatisfied(col)) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grid Total Challenge",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent, // Set the app bar background color
        centerTitle: true, // Center the title
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          // The Grid with row targets at the top
          Row(
            children: [
              const SizedBox(width: 40), // Space for row targets
              ...List.generate(
                gridSize,
                (col) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      colTargets[col].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // The Grid content
          ListView.builder(
            shrinkWrap: true,
            itemCount: gridSize,
            itemBuilder: (context, row) {
              return Row(
                children: [
                  Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: Text(
                      rowTargets[row].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: List.generate(
                        gridSize,
                        (col) => Expanded(
                          child: GestureDetector(
                            onTap: () => onCellTapped(row, col),
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: selectedCells[row][col]
                                    ? (isRowSatisfied(row) &&
                                            isColumnSatisfied(col)
                                        ? Colors.green
                                        : Colors.red)
                                    : Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  grid[row][col].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          // The Reset Button immediately after the grid
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Custom padding
                backgroundColor: Colors.teal, // Background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                elevation: 5, // Shadow effect
              ),
              onPressed: () {
                setState(() {
                  initializeGrid();
                });
              },
              child: const Text(
                "Reset Game",
                style: TextStyle(
                  fontSize: 18, // Text size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button for "How to Play"
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
                      "1. Each row has a target value displayed on the left.\n"
                      "2. Each column has a target value displayed at the top.\n"
                      "3. Tap on grid cells to select or deselect them.\n"
                      "4. The selected cells' total must match the target for both row and column.\n"
                      "5. Complete all rows and columns to win the game!",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tip: Green cells indicate both row and column targets are satisfied.",
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

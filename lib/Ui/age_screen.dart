import 'package:consuelo/Ui/name_screen.dart';
import 'package:flutter/material.dart';

class AgeSelectorScreen extends StatefulWidget {
  const AgeSelectorScreen({super.key});

  @override
  _AgeSelectorScreenState createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {
  int _selectedAge = 18; // Initial selected age
  double _lastDragOffset = 0; // To track the last drag offset

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Age'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Swipe vertically to select your age:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            // Wheel selector for age
            GestureDetector(
              onVerticalDragUpdate: (details) {
                // Calculate the drag distance
                double dragDistance = details.delta.dy;

                // Update the selected age based on drag distance
                if (dragDistance > 0) {
                  _selectedAge = (_selectedAge + 1).clamp(1, 100); // Scroll down
                } else {
                  _selectedAge = (_selectedAge - 1).clamp(1, 100); // Scroll up
                }

                // Store the last drag offset
                _lastDragOffset = dragDistance;
                setState(() {}); // Refresh the UI
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click, // Change cursor to pointer
                child: SizedBox(
                  height: 150, // Set the height of the wheel
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50, // Height of each number
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _selectedAge = index + 1; // Add 1 to start from age 1
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            '${index + 1}', // Display ages starting from 1
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: _selectedAge == index + 1
                                  ? FontWeight.bold // Highlight selected age
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                      childCount: 100, // Number of age options (1 to 100)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Selected Age: $_selectedAge',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NameScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}


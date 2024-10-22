// ignore_for_file: file_names

import 'package:consuelo/Ui/age_screen.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double _weight = 70.0; // Initial weight value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How much do you weight?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select your weight (lbs):',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Weight display, looks like a scale
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${_weight.toStringAsFixed(1)} lbs',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  child: Container(
                    width: 100,
                    height: 4,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Slider for weight selection
            Slider(
              value: _weight,
              min: 30.0,
              max: 150.0,
              divisions: 240, // Creates a more granular slider
              label: _weight.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
           
           
            const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {
                // Navigate to the Home Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AgeSelectorScreen()),
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


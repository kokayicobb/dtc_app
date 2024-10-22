// ignore_for_file: file_names

import 'package:consuelo/Ui/weight_screen.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller to handle input text
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Whats Your Name?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
           
            
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeightScreen()),
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

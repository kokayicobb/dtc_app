import 'package:consuelo/Ui/age_screen.dart';
import 'package:consuelo/Ui/name_screen.dart';
import 'package:consuelo/Ui/weight_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consuelo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 57, 231)),
        useMaterial3: true,
      ),
      home: const NameScreen(),
    );
  }
}


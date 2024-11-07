import 'package:consuelo/Shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.robotoMonoTextTheme( // Set the default text theme to Roboto
          Theme.of(context).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
        ),
      ),
      home:  NikeProductPage(),
    );
  }
}


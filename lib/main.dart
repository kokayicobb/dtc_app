import 'package:consuelo/Auth/auth.dart';
import 'package:consuelo/Sizing/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// Import your other necessary files
import 'package:consuelo/Shop/shop_screen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://jekltqtmycawyupneoje.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impla2x0cXRteWNhd3l1cG5lb2plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA5NzEzMTcsImV4cCI6MjA0NjU0NzMxN30.EuXVYy_6UQJCK2g9c0lRyl22HRFuEA69jfpZuxRlrMM',
  );

  // Sign in anonymously if no user is present
  final supabase = Supabase.instance.client;
  if (supabase.auth.currentUser == null) {
    await supabase.auth.signInAnonymously();
  }

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consuelo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 48, 57, 231)
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoMonoTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.black, 
            displayColor: Colors.black
          ),
        ),
      ),
      home: FutureBuilder<bool>(
        future: checkFirstTimeUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final isFirstTime = snapshot.data ?? true;
          if (isFirstTime) {
            return NikeProductPage(
             
            );
          }
          
          return const NikeProductPage();
        },
      ),
    );
  }
}
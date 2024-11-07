import 'package:consuelo/Sizing/first_screen.dart';
import 'package:consuelo/Sizing/second_screen.dart';
import 'package:consuelo/Sizing/loading_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SizingScreenContent extends StatefulWidget {
  final double width;
  final double height;

  const SizingScreenContent({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _SizingScreenContentState createState() => _SizingScreenContentState();
}

class _SizingScreenContentState extends State<SizingScreenContent> {
  bool showFirstScreen = true;
  bool isLoading = false; // Loading state for when transitioning between screens
  int currentDotIndex = 0; // Track the current dot index for animation
  final List<String> dots = ['.', '..', '...'];

  // Function to toggle between screens
  void toggleScreen() {
    setState(() {
      showFirstScreen = !showFirstScreen;
      if (!showFirstScreen) {
        // When switching to SecondScreen, start loading
        isLoading = true;
      }
    });

    // After 2 seconds, stop loading and show the SecondScreen
    if (!showFirstScreen) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  // Function to update the dot animation every 500ms
  void startDotAnimation() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          currentDotIndex = (currentDotIndex + 1) % dots.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Start the dot animation when the screen is in loading state
    if (isLoading) {
      startDotAnimation();
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: showFirstScreen
          ? FirstScreen(
              onComplete: toggleScreen,
            )
          : isLoading
              ? Center(
                  child: LoadingScreen(
                   
                  ),
                ) // Show loading dots when transitioning
              : SecondScreen(),
    );
  }
}

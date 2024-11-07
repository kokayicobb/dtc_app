import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:consuelo/Utils/typography.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final List<String> dots = ['.', '..', '...'];
  int _currentDotIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _currentDotIndex = (_currentDotIndex + 1) % dots.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth;
    double containerHeight = screenHeight;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,
          backgroundColor:
              Colors.white, // Set to white to match dialog background
          elevation: 0, // Remove shadow
          title: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      BootstrapIcons.x,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  const Spacer(), // Add a Spacer to push text and icon to the center and right
                  Text(
                    'Fit Calculator predicts your size',
                    style: AppTypography.small_5(context),
                  ),
                  const Spacer(), // Add another Spacer

                 
                    const Icon(BootstrapIcons.camera,
                        size: 24, color: Colors.white),
                    
                ],
              ),
            ],
          ),
          titleSpacing: 0,
          
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: containerWidth,
            height: containerHeight,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.black12),
              // borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Text(
            'Loading${dots[_currentDotIndex]}',
            style: AppTypography.caption_4(context),
          ),
  ]),
      ),
    ))));
  }
}
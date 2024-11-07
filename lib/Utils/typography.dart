// First, let's define a Typography class to maintain consistent text styles
import 'package:flutter/material.dart';

class AppTypography {
  // Base size for body text
  static const double bodyFontSize = 16.0;

  // Text scale factors following a modular scale (1.125 ratio)
  static const double displayScale = 1.5; // Largest text (24px)
  static const double headlineScale = 1.25; // Second largest (20px)
  static const double bodyScale = 1.0; // Body text (16px)
  static const double captionScale = 0.75; // Small text (12px)
  static const double smallScale = 0.625; // Smallest text (10px)

  // Reusable text styles
  static TextStyle display_1(BuildContext context) => const TextStyle( // 24px
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        letterSpacing: 2.0,
      );
      static TextStyle display_1_2(BuildContext context) => const TextStyle(
        fontSize: 18,
       fontWeight: FontWeight.w200,
        color: Colors.black,
        letterSpacing: 2.0,
      );

  static TextStyle headline_2(BuildContext context) => const TextStyle( // 20px
        fontSize: bodyFontSize * headlineScale,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle body_3(BuildContext context) => const TextStyle( // 16 px
        fontSize: bodyFontSize * bodyScale, 
        fontWeight: FontWeight.w300,
        color: Colors.black,
      );

  static TextStyle caption_4(BuildContext context) => const TextStyle( // 12 px
        fontSize: bodyFontSize * captionScale,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle small_5(BuildContext context) => const TextStyle( //10 px
        fontSize: bodyFontSize * smallScale,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
}

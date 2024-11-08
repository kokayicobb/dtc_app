import 'dart:math';

import 'package:consuelo/Widgets/sizing_content.dart';
import 'package:flutter/material.dart';

class SizeGuideButton extends StatelessWidget {
  const SizeGuideButton({super.key});

  void showCustomDialog(BuildContext context, RenderBox button) {
    final ScrollableState? scrollable = Scrollable.of(context);
    final double scrollPosition = scrollable?.position.pixels ?? 0.0;
    final Size screenSize = MediaQuery.of(context).size;

    // Get button position
    final buttonPosition = button.localToGlobal(Offset.zero);
    final buttonSize = button.size;

    // Calculate popup dimensions with constraints
    double popUpWidth = min(screenSize.width * 0.3, 400.0); // Max width of 400
    double popUpHeight =
        min(screenSize.height * 0.55, 600.0); // Max height of 600

    // Calculate initial position
    double leftPosition =
        buttonPosition.dx - popUpWidth - 16; // 16px gap from button
    double topPosition = buttonPosition.dy - scrollPosition;

    // Positioning logic with safety margins
    const safetyMargin = 2.0;

    // Horizontal positioning
    if (leftPosition < safetyMargin) {
      // If not enough space on left, position to the right of the button
      leftPosition = buttonPosition.dx + buttonSize.width + safetyMargin;

      // If still doesn't fit, center it horizontally
      if (leftPosition + popUpWidth > screenSize.width - safetyMargin) {
        leftPosition = (screenSize.width - popUpWidth) / 2;
      }
    }

    // Vertical positioning
    if (topPosition < safetyMargin) {
      topPosition = safetyMargin;
    } else if (topPosition + popUpHeight > screenSize.height - safetyMargin) {
      topPosition = screenSize.height - popUpHeight - safetyMargin;
    }

    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: leftPosition,
              top: topPosition,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: popUpWidth,
                  maxHeight: popUpHeight,
                ),
                child: Dialog(
                  backgroundColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizingScreenContent(
                    width: popUpWidth,
                    height: popUpHeight,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => TextButton(
        onPressed: () {
          final RenderBox button = context.findRenderObject() as RenderBox;
          showCustomDialog(context, button);
        },
        style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        child: const Text.rich(
          TextSpan(
            text: 'Fit Calculator ', // Regular text
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'Get exact size', // Text to underline
                style: TextStyle(
                  decoration:
                      TextDecoration.underline, // Underline only this part
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

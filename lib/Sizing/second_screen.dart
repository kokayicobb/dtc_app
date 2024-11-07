import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:consuelo/Utils/typography.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth;
    double containerHeight = screenHeight;

    void showCustomDialog(
        BuildContext context, RenderBox button, Widget contentWidget) {
      final ScrollableState? scrollable = Scrollable.of(context);
      final double scrollPosition = scrollable?.position.pixels ?? 0.0;

      final buttonPosition = button.localToGlobal(Offset.zero);
      double popUpWidth = MediaQuery.of(context).size.width * 0.3;
      double popUpHeight = MediaQuery.of(context).size.height;

      double leftPosition = buttonPosition.dx - popUpWidth - 50;
      double topPosition = buttonPosition.dy - scrollPosition - 40;

      if (leftPosition < 0) leftPosition = 0;
      if (topPosition + popUpHeight > MediaQuery.of(context).size.height) {
        topPosition = MediaQuery.of(context).size.height - popUpHeight;
      }
      if (topPosition < 0) topPosition = 0;

      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Positioned(
                left: leftPosition,
                top: topPosition,
                child: Dialog(
                  backgroundColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    width: popUpWidth,
                    height: popUpHeight,
                    child: contentWidget,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                'Based on your size profile,\n', // Add a newline character for the line break
                            style: AppTypography.body_3(context)),
                        TextSpan(
                            text: 'in this item we think you are size',
                            style: AppTypography.body_3(context)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: containerHeight * .05,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Size = M / 58 cm'.toUpperCase(),
                      style: AppTypography.display_1(context),
                    ),
                  ),
                  SizedBox(
                    height: containerHeight * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(
                      //   width: containerHeight * .05,
                      // ),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth:
                              28, // Adjust these values to make the circle tighter
                          minHeight:28,
                          maxWidth: 28,
                          maxHeight: 28,
                        ),
                        decoration: BoxDecoration(
                          // borderRadius: 1,
                          color: Colors.white, // White fill for the background
                          shape: BoxShape.circle, // Circular shape
                          border: Border.all(
                            color: Colors.black, // Black border color
                            width: .7, // Adjust width as needed
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            BootstrapIcons.question,
                            size: 16,
                            color: Colors.black, // Black color for the icon
                          ),
                          onPressed: () {
                            // Your onPressed function here
                          },
                        ),
                      ),
                      SizedBox(
                        width: containerHeight * .015,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Privacy Policy',
                              style: AppTypography.small_5(context).copyWith(
                                // Updated from fontSize: 10
                                decoration: TextDecoration.underline,
                                decorationThickness: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

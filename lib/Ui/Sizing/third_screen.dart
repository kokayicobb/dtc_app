import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:consuelo/Ui/Sizing/first_screen.dart';
import 'package:consuelo/Ui/Sizing/third_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth ;
    double containerHeight = screenHeight *.45;
    double fontSize = containerWidth < 300 ? 12 : 16;
    void showCustomDialog(
      BuildContext context, RenderBox button, Widget contentWidget) {
    final ScrollableState? scrollable = Scrollable.of(context);
    final double scrollPosition = scrollable?.position.pixels ?? 0.0;

    final buttonPosition = button.localToGlobal(Offset.zero);
    double popUpWidth = MediaQuery.of(context).size.width * 0.3;
    double popUpHeight = MediaQuery.of(context).size.height * 0.5;

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
      ),child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
           automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
           titleSpacing: 0,
          title:  Row(mainAxisAlignment: MainAxisAlignment.start,
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
               
      
               
                
              ],
            ),
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
                  Text(
                    'Based ,',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'in this item we think you are size',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'SIZE: M / 58 cm',
                    style: TextStyle(
                      fontSize: fontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                                        SizedBox(
                   width: containerWidth * .03,
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

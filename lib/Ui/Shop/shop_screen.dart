import 'package:consuelo/Ui/Sizing/first_screen.dart';
import 'package:consuelo/Ui/Sizing/second_screen.dart';
import 'package:flutter/material.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({Key? key}) : super(key: key);

  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  bool showSecondScreen = false;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Name'),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://www.tacknrider.com/wp-content/uploads/2016/01/kask-riding-helmet-star-lady-shadow-black-front.jpg',
              fit: BoxFit.cover,
              height: screenHeight * .4,
              width: screenHeight * .4,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Title',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$49.99',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This is a detailed description of the product.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      SizedBox(width: screenWidth * .7),
                      Column(
                        children: [
                          Builder(
                            builder: (context) => TextButton(
                              onPressed: () {
                                final RenderBox button =
                                    context.findRenderObject() as RenderBox;
                                showCustomDialog(
                                  context,
                                  button,
                                  FirstScreen(
                                    onComplete: () {
                                      showCustomDialog(
                                        context,
                                        button,
                                        SecondScreen(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Text('Size Guide'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Product Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('• Feature 1\n• Feature 2\n• Feature 3'),
                  const SizedBox(height: 360),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _navigateToFitQuestionsScreen(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0); // Slide from left to right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}

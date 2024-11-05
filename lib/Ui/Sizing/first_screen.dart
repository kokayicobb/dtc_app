import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:consuelo/Ui/Sizing/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  final VoidCallback onComplete; // Add this callback

  const FirstScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? headCircumference;
  String? headShape;
  String? typicalHairstyle;
  String? fitPreference;

  List<String> cmOptions =
      List<String>.generate(13, (index) => '${51 + index} cm');
  final List<String> headShapes = ['Round', 'Intermediate', 'Long'];
  final List<String> hairstyles = ['Short', 'Ponytail', 'Braided', 'Bun', 'Down'];
  final List<String> fitPreferences = ['Tighter', 'Perfect','Looser'];

  void checkIfComplete() {
    if (headCircumference != null &&
        headShape != null &&
        typicalHairstyle != null &&
        fitPreference != null) {
      widget.onComplete(); // Use callback to show SecondScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.53;
    double containerHeight = screenHeight;
    double fontSize = containerWidth < 300 ? 12 : 16;

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
          title: Row(
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
              const Text(
                'Size Reccomender calculate your size',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Ensure text is black
                ),
              ),
              const Spacer(), // Add another Spacer

              IconButton(
                icon: const Icon(BootstrapIcons.camera,
                    size: 24, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          titleSpacing: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'My Helmet Size Is',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8,),
                buildDropdown(
                  label: 'Select a head circumference?',
                  value: headCircumference,
                  items: cmOptions,
                  fontSize: fontSize,
                  onChanged: (items) {
                    setState(() {
                      headCircumference = items;
                    });
                  },
                  dropdownColor: Colors.white,
                  enabled: true,
                ),
                const SizedBox(height: 8.0),
                buildDropdown(
                  label: 'Select a head shape',
                  value: headShape,
                  items: headShapes,
                  fontSize: fontSize,
                  onChanged: (value) {
                    setState(() {
                      headShape = value;
                    });
                  },
                  dropdownColor: Colors.grey[800],
                  enabled: headCircumference != null,
                ),
                const SizedBox(height: 8.0),
                buildDropdown(
                  label: 'Select a typical hairstyle',
                  value: typicalHairstyle,
                  items: hairstyles,
                  fontSize: fontSize,
                  onChanged: (value) {
                    setState(() {
                      typicalHairstyle = value;
                    });
                  },
                  dropdownColor: Colors.grey[800],
                  enabled: headShape != null,
                ),
                const SizedBox(height: 8.0),
                buildDropdown(
                  label: 'Select a fit preference',
                  value: fitPreference,
                  items: fitPreferences,
                  fontSize: fontSize,
                  onChanged: (value) {
                    setState(() {
                      fitPreference = value;
                    });
                    checkIfComplete();
                  },
                  dropdownColor: Colors.grey[800],
                  enabled: typicalHairstyle != null,
                ),
                const SizedBox(height: 8,),
                const Text('1/2',
                style: TextStyle(fontSize: 14),),
              
                const Text.rich(
  TextSpan(
    children: [
      const TextSpan(
        text: 'By using Size Reccomender you agree to our ',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: 'Privacy Policy',
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          decoration: TextDecoration.underline, // Underline the text
        ),
      ),
    ],
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required double fontSize,
    required ValueChanged<String?> onChanged,
    required Color? dropdownColor,
    required bool enabled,
  }) {
    return DropdownButtonFormField<String>(
      
      
      decoration: const InputDecoration(
        // labelText: label,
        
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(),
        isDense: true,
        
      ),
      value: label,
      items: [
        const DropdownMenuItem(
          enabled: false,
          child: Center(
            child: Icon(Icons.arrow_drop_up, color: Colors.black),
          ),
        ),
        DropdownMenuItem<String>(
          value: label,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        ...items.map((String itemValue) {
          return DropdownMenuItem<String>(
            value: itemValue,
            child: Text(
              itemValue,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        const DropdownMenuItem(
          enabled: false,
          child: Center(
            child: Icon(Icons.arrow_drop_down, color: Colors.black),
          ),
        ),
      ],
      onChanged: enabled
          ? (selectedValue) {
              // To ensure the label is only used as a placeholder, prevent selection of it
              if (selectedValue != label) {
                onChanged(selectedValue);
              }
            }
          : null,
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,
      style: TextStyle(
          color: Colors.black,
          fontSize: 14), // Black color for the selected item
      isExpanded: false,
      menuMaxHeight: 400.0,
    );
  }
}


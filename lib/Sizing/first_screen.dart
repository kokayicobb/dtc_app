import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:consuelo/Utils/responsize.dart';
import 'package:consuelo/Utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final List<String> headShapes = [
    'Round Oval',
    'Intermediate Oval',
    'Long Oval'
  ];
  final List<String> hairstyles = [
    'Short Hair',
    'Low Ponytail',
    'Low Braided Ponytail',
    'French Braid',
    'Double Braids (Pigtail)',
    'Low Bun',
    'Braided Bun',
    'Tucked Ponytail',
    'Half-Up Braid'
  ];
  final List<String> fitPreferences = [
    'Tight Fit',
    'Perfect Fit',
    'Loose Fit',
  ];

  
Future<void> submitDataToSupabase() async {
    try {
      final supabase = Supabase.instance.client;
      
      // Get current user ID
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        debugPrint('No user is signed in');
        return;
      }

      await supabase.from('fit_calculator').insert({
        'user_id': userId,  // Associate data with the user
        'head_circumference': headCircumference,
        'head_shape': headShape,
        'typical_hairstyle': typicalHairstyle,
        'fit_preference': fitPreference,
      });  // Removed .execute()

      debugPrint('Data saved successfully');
      // Call the completion callback after successful save
      if (mounted) {  // Check if widget is still mounted
        widget.onComplete();
      }
      
    } catch (e) {
      debugPrint('Error saving data: $e');
      if (mounted) {  // Check if widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error saving data. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> checkIfComplete() async {
    if (headCircumference != null &&
        headShape != null &&
        typicalHairstyle != null &&
        fitPreference != null) {
      // Show loading indicator
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: Text('')),
      );

      try {
        await submitDataToSupabase();
        // Remove loading indicator
        Navigator.pop(context);
      } catch (e) {
        // Remove loading indicator
        Navigator.pop(context);
        // Error already handled in submitDataToSupabase
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double fontSize = 10;
    ScreenUtil().init(context);

    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(100),
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

                  IconButton(
                    icon: const Icon(BootstrapIcons.camera,
                        size: 24, color: Colors.black),
                    onPressed: () async {
                      try {
                        final image = await ImagePickerWeb.getImageAsBytes();
                        if (image != null) {
                          // Handle the image bytes here
                          // You can convert to base64 or handle as needed
                          print('Image captured successfully');
                        }
                      } catch (e) {
                        print('Error capturing image: $e');
                      }
                    },
                  ),
                ],
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
                Text(
                  'My Helmet Size Is',
                  style: AppTypography.body_3(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                buildDropdown(
                  label: 'Select a head circumference'.toUpperCase(),
                  value: headCircumference,
                  items: cmOptions,
                  fontSize: 8,
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
                  label: 'Select a head shape'.toUpperCase(),
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
                  label: 'Select a hairstyle'.toUpperCase(),
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
                  label: 'Select a fit preference'.toUpperCase(),
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
                const SizedBox(
                  height: 16,
                ),
                Text('1/2', style: AppTypography.caption_4(context)),
                const SizedBox(
                  height: 8,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'By using Fit Calculator you agree to our ',
                          style: AppTypography.small_5(context)),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          decoration:
                              TextDecoration.underline, // Underline the text
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
      decoration: InputDecoration(
        // labelText: label,

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: AppTypography.small_5(context),
        border: OutlineInputBorder(),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 0.7), // Black border when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 0.7), // Black border when enabled
        ),
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
          child: Text(label, style: AppTypography.caption_4(context)),
        ),
        ...items.map((String itemValue) {
          return DropdownMenuItem<String>(
            value: itemValue,
            child: Text(itemValue, style: AppTypography.caption_4(context)),
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

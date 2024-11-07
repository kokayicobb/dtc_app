import 'package:flutter/widgets.dart';

class ScreenUtil {
  late double screenWidth;
  late double screenHeight;

  static final ScreenUtil _instance = ScreenUtil._internal();

  ScreenUtil._internal();

  factory ScreenUtil() => _instance;

  bool _initialized = false;

  void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    _initialized = true;
  }

  void _checkInit() {
    if (!_initialized) {
      throw Exception("ScreenUtil has not been initialized. Call ScreenUtil().init(context) before using.");
    }
  }

  double setWidth(double width) {
    _checkInit();
    return width * (screenWidth / 275); // 375 as base width
  }

  double setHeight(double height) {
    _checkInit();
    return height * (screenHeight / 412); // 812 as base height
  }

  double setFontSize(double fontSize) {
    _checkInit();
    return fontSize * (screenWidth / 375);
  }
}

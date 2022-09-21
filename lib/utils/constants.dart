import 'package:flutter/material.dart';

Color primary = const Color(0xFFffe6e6);

enum Gender { male, female, other, none }

class Styles {
  static Color primaryColor = primary;
  static const Color accentColor = Color(0xFFef8354);
  static Color textColorHeadline = const Color(0xFF707070);
  static Color textColor = const Color(0xFF4B4949);
  static Color userCardColor = const Color(0xFFFF9494).withOpacity(0.5);
  static TextStyle textStyleCard = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle textStyleCardTap = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  static TextStyle headLineStyle = const TextStyle(fontSize: 40, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle2 = const TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  static TextStyle kTexStyleBold = const TextStyle(color: Color(0xFF0A1028), fontWeight: FontWeight.w700, fontSize: 24);
  static TextStyle kTexStyle = const TextStyle(color: Color(0xFF0A1028), fontWeight: FontWeight.w400, fontSize: 16);
  static TextStyle kTextStyleWhiteboldTitle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30);
  static TextStyle kTextStyleWhiteboldsubtitle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24);
  static TextStyle kTextStyleWhiteResult =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20);
  static TextStyle kTextStyleWhite = const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);
  static double kBottomContainerHeight = 80.0;
  static Color kBottomContainerColour = const Color(0xFFEB1555);
  static TextStyle kLargeButtonTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
}

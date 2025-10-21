import 'package:flutter/material.dart';

abstract class AppColorsLight {
  static const Color white = Color(0xffFFFFFF);
  static const Color gray = Color(0xff535353);
  static const Color green = Color(0xff0CB359);
  static const Color red = Color(0xffFF3B30);
  static const Color shimmerColor = Color(0xffebebf4);
  static const Color shimmerColorSecondary = Color(0x4Da6a6a6);
  static const Color glassContainerColor = Color(0xff242424);

  static const MaterialColor black = MaterialColor(0xFF000000, <int, Color>{
    10: Color(0xFFD9D9D9), // lightest gray
    20: Color(0xFFD9D9D9),
    30: Color(0xFFBDBDBD),
    40: Color(0xFF9E9E9E),
    50: Color(0xFF757575),
    60: Color(0xFF616161),
    70: Color(0xFF424242),
    80: Color(0xFF303030),
    90: Color(0xFF121212),
    100: Color(0xFF000000), // darkest (base black)
  });
  static const MaterialColor orange = MaterialColor(0xFFFF4100, <int, Color>{
    10: Color(0xFFFFFBF2), // lightest orange tint
    20: Color(0xFFFFF8E1),
    30: Color(0xFFFFF3E0),
    40: Color(0xFFFFECB3),
    50: Color(0xFFFFE0B2),
    60: Color(0xFFFFCCBC),
    70: Color(0xFFFFAB91),
    80: Color(0xFFFF8A65),
    90: Color(0xFFFF7043),
    100: Color(0xFFFF4100), // base vibrant orange
  });
  static const MaterialColor darkOrange = MaterialColor(0xFFBF3100, <int, Color>{
    10: Color(0xFFFFF3E0), // lightest
    20: Color(0xFFFFCCBC),
    30: Color(0xFFFFA270),
    40: Color(0xFFFF7043),
    50: Color(0xFFFF5722),
    60: Color(0xFFDD3E00),
    70: Color(0xFFBF3100),
    80: Color(0xFF802100),
    90: Color(0xFF401000),
    100: Color(0xFF000000), // deepest shade
  });

}

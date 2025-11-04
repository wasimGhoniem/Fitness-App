import 'package:responsive_framework/responsive_framework.dart';

abstract class AppSizes {
  // padding and margin sizes
  static const double padding_4 = 4.0;
  static const double padding_8 = 8.0;
  static const double padding_12 = 12.0;
  static const double padding_10 = 10.0;
  static const double padding_16 = 16.0;
  static const double padding_20 = 20.0;
  static const double padding_24 = 24.0;
  static const double padding_30 = 30.0;
  static const double padding_32 = 32.0;
  static const double padding_36 = 36.0;
  static const double padding_64 = 64.0;
  static const double padding_100 = 100.0;

  // icon sizes

  static const double icon_8 = 8.0;
  static const double icon_12 = 12.0;
  static const double icon_16 = 16.0;
  static const double icon_18 = 18.0;
  static const double icon_24 = 24.0;
  static const double icon_30 = 30.0;
  static const double icon_32 = 32.0;
  static const double icon_36 = 36.0;
  static const double icon_60 = 60.0;
  static const double icon_64 = 64.0;
  static const double icon_120 = 120.0;

  // font sizes
  static const double font_10 = 10.0;
  static const double font_12 = 12.0;
  static const double font_13 = 13.0;
  static const double font_14 = 14.0;
  static const double font_16 = 16.0;
  static const double font_18 = 18.0;
  static const double font_20 = 20.0;
  static const double font_22 = 22.0;
  static const double font_24 = 24.0;
  static const double font_28 = 28.0;
  static const double font_32 = 32.0;
  static const double font_36 = 36.0;
  static const double font_44 = 44.0;
  static const double font_45 = 45.0;
  static const double font_57 = 57.0;
  static const double font_72 = 72.0;
  static const double font_96 = 96.0;

  // button sizes
  static const double buttonHigh_38 = 38;
  static const double buttonWidthInfinity = double.infinity;
  static const double buttonWidth_80 = 80.0;

  // Default Spacing Between items
  static const double spaceBetweenItems_2 = 2.0;
  static const double spaceBetweenItems_4 = 4.0;
  static const double spaceBetweenItems_6 = 6.0;
  static const double spaceBetweenItems_8 = 8.0;
  static const double spaceBetweenItems_10 = 10.0;
  static const double spaceBetweenItems_12 = 12.0;
  static const double spaceBetweenItems_16 = 16.0;
  static const double spaceBetweenItems_20 = 20.0;
  static const double spaceBetweenItems_24 = 24.0;
  static const double spaceBetweenItems_28 = 28.0;
  static const double spaceBetweenItems_32 = 32.0;
  static const double spaceBetweenItems_36 = 36.0;
  static const double spaceBetweenItems_40 = 40.0;
  static const double spaceBetweenItems_42 = 42.0;
  static const double spaceBetweenItems_44 = 44.0;
  static const double spaceBetweenItems_48 = 48.0;
  static const double spaceBetweenItems_50 = 50.0;

  // Border Radius

  static const double borderRadius_2 = 2.0;
  static const double borderRadius_4 = 4.0;
  static const double borderRadius_8 = 8.0;
  static const double borderRadius_10 = 10.0;
  static const double borderRadius_12 = 12.0;
  static const double borderRadius_16 = 16.0;
  static const double borderRadius_20 = 20.0;
  static const double borderRadius_24 = 24.0;
  static const double borderRadius_32 = 32.0;
  static const double borderRadius_40 = 32.0;
  static const double borderRadius_50 = 50.0;
  static const double borderRadiusFull = 100.0;

  //Border Width
  static const double borderWidth_1 = 1.0;
  static const double borderWidth_2 = 2.0;
  static const double borderWidth_3 = 3.0;
  static const double borderWidth_4 = 4.0;

  // Divider Height
  static const double dividerHeight_1 = 1.0;
  static const double dividerHeight_2 = 2.0;
  static const double dividerHeight_3 = 3.0;
  static const double dividerHeight_4 = 4.0;
  static const double dividerHeight_5 = 5.0;
  static const double dividerHeight_6 = 6.0;
  static const double dividerHeight_7 = 7.0;
  static const double dividerHeight_8 = 8.0;
  static const double dividerHeight_9 = 9.0;
  static const double dividerHeight_10 = 10.0;

  // pinCode sizes
  static const int pinCodeLength_6 = 6;
  static const double pinCodeWidth_68 = 68;
  static const double pinCodeHeight_74 = 74;
  static const double pinCodeBorderWidth_3 = 3;
  static const double pinCodeCursorHeight_40 = 40;

  //app bar height
  static const double appBarHeight_29 = 29.0;

  // break points

  static const List<Breakpoint> appBreakPoints = [
    Breakpoint(start: 0, end: 450, name: 'MOBILE'),
    Breakpoint(start: 451, end: 800, name: 'TABLET'),
    Breakpoint(start: 801, end: 1920, name: 'DESKTOP'),
  ];
  static const List<Breakpoint> appLandscapeBreakPoints = [
    Breakpoint(start: 0, end: 1023, name: 'MOBILE'),
    Breakpoint(start: 1024, end: 1599, name: 'TABLET'),
    Breakpoint(start: 1600, end: double.infinity, name: 'DESKTOP'),
  ];

  static const List<Condition<double>> conditionalValues = [
    Condition.between(start: 0, end: 450, value: 375),
    Condition.between(start: 451, end: 768, value: 600),
    Condition.between(start: 769, end: 1024, value: 1024),
  ];
}

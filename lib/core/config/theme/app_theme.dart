import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/config/theme/text_theme.dart';
import 'package:fitness_app/core/utils/constants/app_fonts.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class AppThemeLight {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.font_12,
          fontFamily: AppFonts.baloo,
          color: AppColorsLight.orange,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColorsLight.dividerColor,
        thickness: 1,
      ),


      tabBarTheme: (TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        dividerHeight: 0,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding_24,
        ),
        indicator: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.font_12,
          fontFamily: AppFonts.baloo,
          color: AppColorsLight.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.font_12,
          fontFamily: AppFonts.baloo,
        ),
      )),



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsLight.orange,
          foregroundColor: AppColorsLight.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: AppSizes.font_14,
            fontFamily: AppFonts.baloo,
            color: AppColorsLight.white,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            fontSize: AppSizes.font_14,
            fontFamily: AppFonts.baloo,
          ),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColorsLight.orange,
        selectionColor: AppColorsLight.orange,
        selectionHandleColor: AppColorsLight.orange,
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: AppSizes.padding_16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.font_12,
          fontFamily: AppFonts.baloo,
          color: AppColorsLight.red,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.font_12,
          fontFamily: AppFonts.baloo,
          color: AppColorsLight.black[20]!,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          borderSide: BorderSide(color: AppColorsLight.black[10]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          borderSide: BorderSide(color: AppColorsLight.black[10]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          borderSide: BorderSide(color: AppColorsLight.black[10]!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          borderSide: const BorderSide(color: AppColorsLight.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
          borderSide: const BorderSide(color: AppColorsLight.red),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsLight.orange,
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme = getTheme(
    const ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsLight.orange,
      onPrimary: AppColorsLight.white,
      secondary: AppColorsLight.black,
      onSecondary: AppColorsLight.white,
      surface: AppColorsLight.white,
      onSurface: AppColorsLight.white,
      error: AppColorsLight.red,
      onError: AppColorsLight.white,
    ),
  );
}

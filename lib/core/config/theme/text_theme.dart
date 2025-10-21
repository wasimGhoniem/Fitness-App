import 'package:fitness_app/core/utils/constants/app_fonts.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

final TextTheme textTheme = TextTheme(
  displayMedium: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_24,
    fontWeight: FontWeight.w600,
  ),
  displayLarge: TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_44,
    fontWeight: FontWeight.w800,
  ),
  displaySmall: TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: AppSizes.font_14,
    fontWeight: FontWeight.w400,
  ),

  headlineMedium: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_36,
    fontWeight: FontWeight.w800,
  ),
  headlineSmall: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_32,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_28,
    fontWeight: FontWeight.w700,
  ),
  titleMedium: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_24,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_22,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_20,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_18,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_16,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_14,
    fontWeight: FontWeight.w500,
  ),
  labelMedium: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_12,
    fontWeight: FontWeight.w400,
  ),
  labelSmall: const TextStyle(
    fontFamily: AppFonts.baloo,
    fontSize: AppSizes.font_10,
    fontWeight: FontWeight.w400,
  ),
);

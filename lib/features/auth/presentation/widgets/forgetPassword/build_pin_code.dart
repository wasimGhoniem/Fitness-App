import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class BuildPinCode extends StatelessWidget {
  const BuildPinCode({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: AppColorsLight.orange,
    );

    final defaultPinTheme = PinTheme(
      width: AppSizes.pinCodeWidth_68,
      height: AppSizes.pinCodeHeight_74,
      textStyle: baseTextStyle,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColorsLight.white,
                  width: AppSizes.pinCodeBorderWidth_3
              )
          )
      ),
    );

    final submittedPinTheme = PinTheme(
      width: AppSizes.pinCodeWidth_68,
      height: AppSizes.pinCodeHeight_74,
      textStyle: baseTextStyle,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColorsLight.orange,
            width: AppSizes.pinCodeBorderWidth_3
          )
        )
      ),
    );

    final errorPinTheme = PinTheme(
      width: AppSizes.pinCodeWidth_68,
      height: AppSizes.pinCodeHeight_74,
      textStyle: baseTextStyle,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColorsLight.red,
                  width:AppSizes.pinCodeBorderWidth_3
              )
          )
      ),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppSizes.pinCodeBorderWidth_3,
          height: AppSizes.pinCodeCursorHeight_40,
          decoration: BoxDecoration(
            color: AppColorsLight.orange,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );

    return Pinput(
      length: AppSizes.pinCodeLength_6,
      controller: controller,
      keyboardType: TextInputType.number,
      pinAnimationType: PinAnimationType.slide,
      validator: Validations.pinCodeValidator,
      defaultPinTheme: defaultPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      cursor: cursor,
    );
  }
}
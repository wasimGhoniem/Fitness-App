import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.widget,
    this.loadingColor,
    this.textColor,
    this.containerColor,
    this.buttonHigh,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final Widget widget;
  final Color? textColor;
  final Color? loadingColor;
  final Color? containerColor;
  final double? buttonHigh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: AppSizes.buttonHigh_38,
        width: isLoading
            ? AppSizes.buttonWidth_80
            : MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: isLoading
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      containerColor ?? Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadiusFull,
                  ),
                ),
                child: SizedBox(
                  //need to test
                  width: 24,
                  height: 24,
                  child: Theme(
                    data: ThemeData(
                      progressIndicatorTheme: ProgressIndicatorThemeData(
                        color:
                            loadingColor ??
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              )
            : SizedBox(
                height: buttonHigh ?? AppSizes.buttonHigh_38,
                child: ElevatedButton(onPressed: onPressed, child: widget),
              ),
      ),
    );
  }
}

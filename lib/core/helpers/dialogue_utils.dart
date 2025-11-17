import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class DialogueUtils {
  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? ngeActionName,
    Function? ngeAction,
  }) {
    final List<Widget> actions = [];
    if (ngeActionName != null) {
      actions.add(
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            ngeAction?.call();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColorsLight.orange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius_8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding_24,
              vertical: AppSizes.padding_12,
            ),
          ),
          child: Text(
            ngeActionName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    if (posActionName != null) {
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorsLight.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius_8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding_24,
              vertical: AppSizes.padding_12,
            ),
          ),
          child: Text(
            posActionName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColorsLight.black[80],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          title: title != null && title.isNotEmpty
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColorsLight.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : null,
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.only(
            bottom: AppSizes.padding_20,
            left: AppSizes.padding_16,
            right: AppSizes.padding_16,
          ),
          actions: actions,
        );
      },
    );
  }
}

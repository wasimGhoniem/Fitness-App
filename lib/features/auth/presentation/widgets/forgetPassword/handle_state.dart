import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:flutter/material.dart';

void handleState<T>({
  required BuildContext context,
  required T status,
  required String successMessage,
  required String errorMessage,
  VoidCallback? onSuccess,
  VoidCallback? onError,
}) {
  if (status == ForgetPasswordStatus.error) {
    if(!context.mounted) return;
    DialogueUtils.showMessage(
      context: context,
      message: errorMessage,
      title: LocaleKeys.error.tr(),
      posActionName: LocaleKeys.ok.tr(),
      posAction: onError,
    );
  } else if (status == ForgetPasswordStatus.success) {
    if(!context.mounted) return;
    DialogueUtils.showMessage(
      context: context,
      message: successMessage,
      title: LocaleKeys.success.tr(),
      posActionName: LocaleKeys.ok.tr(),
      posAction: onSuccess,
    );
  }
}
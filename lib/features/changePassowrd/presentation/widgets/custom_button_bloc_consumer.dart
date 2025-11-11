import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/Widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/change_password_event.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/change_password_stats.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/chnage_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuustomButtonBlocConsumer extends StatelessWidget {
  const CuustomButtonBlocConsumer({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.changePasswordViewModel,
    required this.formKey,
  });
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final ChangePasswordViewModel changePasswordViewModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
      listenWhen: (p, c) =>
          p.failure != c.failure ||
          p.resetPasswordSuccess != c.resetPasswordSuccess,
      listener: (context, state) {
        if (state.failure != null && state.resetPasswordSuccess == false) {
          DialogueUtils.showMessage(
            context: context,
            title: LocaleKeys.error.tr(),
            message: state.failure!.errorMessage,
            posActionName: LocaleKeys.ok.tr(),
          );
        }
        if (state.resetPasswordSuccess) {
          DialogueUtils.showMessage(
            context: context,
            title: LocaleKeys.success.tr(),
            message: LocaleKeys.updated_successfully.tr(),
            posActionName: LocaleKeys.ok.tr(),
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state.isLoading,
          widget: Text(LocaleKeys.done.tr()),
          onPressed: () {
            final resetPasswordRequestModel = ChangePasswordRequestModel(
              newPassword: newPasswordController.text,
              password: currentPasswordController.text,
            );
            if (formKey.currentState!.validate()) {
              changePasswordViewModel.doIntent(
                event: ChangePasswordEvent(),
                changePasswordRequestModel: resetPasswordRequestModel,
              );
            }
          },
        );
      },
    );
  }
}

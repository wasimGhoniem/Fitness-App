import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_password_text_form_field.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_view_model.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.viewModel});

  final SignInViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.signInKey,
      child: Column(
        children: [
          TextFormField(
            style: Theme.of(context).textTheme.bodySmall,
            controller: viewModel.emailController,
            decoration: InputDecoration(
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.padding_16,
                  right: AppSizes.padding_4,
                ),
                child: Icon(
                  Icons.email_outlined,
                  color: AppColorsLight.black[20],
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: AppSizes.icon_20,
                minHeight: AppSizes.icon_20,
              ),
            ),
            validator: Validations.validateEmail,
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_16),
          CustomPasswordTextFormField(
            prefixIconPath: Assets.assetsIconsPasswordIcon,
            controller: viewModel.passwordController,
            hint: LocaleKeys.password.tr(),
            validator: Validations.validatePassword,
          ),
        ],
      ),
    );
  }
}

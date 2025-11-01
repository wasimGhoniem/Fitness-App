import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.emailController,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: AppSizes.spaceBetweenItems_16,
        children: [
          TextFormField(
            controller: firstNameController,
            validator: (value) => Validations.validateName(value),
            decoration: InputDecoration(
              hintText: LocaleKeys.first_name.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.padding_16,
                  right: AppSizes.padding_4,
                ),
                child: Image.asset(
                  Assets.assetsIconsPersonIcon,
                  width: AppSizes.icon_18,
                  height: AppSizes.icon_18,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: AppSizes.icon_18,
                minHeight: AppSizes.icon_18,
              ),
            ),
          ),
          TextFormField(
            controller: lastNameController,
            validator: (value) => Validations.validateName(value),
            decoration: InputDecoration(
              hintText: LocaleKeys.last_name.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.padding_16,
                  right: AppSizes.padding_4,
                ),
                child: Image.asset(
                  Assets.assetsIconsPersonIcon,
                  width: AppSizes.icon_18,
                  height: AppSizes.icon_18,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: AppSizes.icon_18,
                minHeight: AppSizes.icon_18,
              ),
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: (value) => Validations.validateEmail(value),
            decoration: InputDecoration(
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.padding_16,
                  right: AppSizes.padding_4,
                ),
                child: SvgPicture.asset(
                  Assets.assetsIconsMail,
                  width: AppSizes.icon_18,
                  height: AppSizes.icon_18,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: AppSizes.icon_18,
                minHeight: AppSizes.icon_18,
              ),
            ),
          ),
          CustomPasswordTextFormField(
            prefixIconPath: Assets.assetsIconsPasswordIcon,
            validator: (value) => Validations.validatePassword(value),
            controller: passwordController,
            hint: LocaleKeys.password.tr(),
          ),
        ],
      ),
    );
  }
}

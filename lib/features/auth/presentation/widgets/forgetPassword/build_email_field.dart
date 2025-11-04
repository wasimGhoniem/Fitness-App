import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildEmailField extends StatelessWidget {
  const BuildEmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.email],
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          hintText: LocaleKeys.email.tr(),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 17,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 16,
              bottom: 4,
              right: 4
            ),
            child: SvgPicture.asset(
                Assets.assetsIconsMailIcon,
              color: AppColorsLight.white.withOpacity(0.7),
              width: 20,
              height: 20,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.only(
            top: 8,
            left: 16,
            bottom: 8,
          ),
        ),
        validator: Validations.validateEmail,
      ),
    );
  }
}
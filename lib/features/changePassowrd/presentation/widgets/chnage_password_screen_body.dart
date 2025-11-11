import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_password_text_form_field.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/chnage_password_view_model.dart';
import 'package:fitness_app/features/changePassowrd/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  State<ChangePasswordScreenBody> createState() =>
      _ChangePasswordScreenBodyState();
}

late TextEditingController _currentPasswordController;
late TextEditingController _newPasswordController;
late TextEditingController _confirmPasswordController;
late ChangePasswordViewModel _changePasswordViewModel;
late GlobalKey<FormState> _formKey;

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _changePasswordViewModel = getIt<ChangePasswordViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlassLayout(
      backGroundImage: Assets.assetsImagesAuthBg,
      child: BlocProvider.value(
        value: _changePasswordViewModel,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppSizes.spaceBetweenItems_48),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.assetsIconsFitnessAppIcon,
                    width: 70,
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_48),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.borderRadius_16,
                  ),
                  child: Text(
                    LocaleKeys.password_hint.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.borderRadius_16,
                  ),
                  child: Text(
                    LocaleKeys.create_new_password.tr(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_24),
                GlassContainer(
                  width: double.infinity,
                  contentPadding: const EdgeInsetsGeometry.symmetric(
                    horizontal: AppSizes.padding_32,
                    vertical: AppSizes.padding_24,
                  ),
                  body: [
                    CustomPasswordTextFormField(
                      controller: _currentPasswordController,
                      validator: (value) => Validations.validatePassword(value),
                      hint: LocaleKeys.old_password.tr(),
                      prefixIconPath: Assets.assetsIconsPasswordIcon,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_24),
                    CustomPasswordTextFormField(
                      controller: _newPasswordController,
                      validator: (value) => Validations.validatePassword(value),
                      hint: LocaleKeys.new_password.tr(),
                      prefixIconPath: Assets.assetsIconsPasswordIcon,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_24),
                    CustomPasswordTextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) => Validations.validateConfirmPassword(
                        value,
                        _newPasswordController.text,
                      ),
                      hint: LocaleKeys.confirm_password.tr(),
                      prefixIconPath: Assets.assetsIconsPasswordIcon,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_48),
                    CuustomButtonBlocConsumer(
                      currentPasswordController: _currentPasswordController,
                      newPasswordController: _newPasswordController,
                      changePasswordViewModel: _changePasswordViewModel,
                      formKey: _formKey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

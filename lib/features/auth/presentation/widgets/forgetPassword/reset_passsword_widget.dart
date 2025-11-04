import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_password_text_form_field.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    return GlassLayout(
        backGroundImage: Assets.assetsImagesAuthBg,
        body: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          // App Logo
          Center(
            child: Image.asset(
              Assets.assetsIconsFitnessAppIcon,
              height: AppSizes.padding_100,
              width: AppSizes.padding_100,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.1),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: LocaleKeys.make_sure_its_8.tr(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColorsLight.white,
                    fontSize: AppSizes.font_18,
                    fontWeight: FontWeight.w400,
                  ),
              ),
              CustomText(
                text: LocaleKeys.create_new_password.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColorsLight.white,
                  fontSize: AppSizes.font_20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_16),
              GlassContainer(
                width: MediaQuery.of(context).size.width,
                body: [
                  Form(
                    key: viewModel.resetPasswordKey,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.padding_16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomPasswordTextFormField(
                                controller: viewModel.newPasswordController,
                                hint: LocaleKeys.password.tr(),
                            ),
                            const SizedBox(height: AppSizes.spaceBetweenItems_32),
                            CustomPasswordTextFormField(
                                controller: viewModel.confirmPasswordController,
                                hint: LocaleKeys.password.tr(),
                            ),
                            const SizedBox(height: AppSizes.spaceBetweenItems_32),
                            BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                              builder: (context, state) {
                                return CustomElevatedButton(
                                  onPressed: () =>
                                      viewModel.doIntent(ResetPasswordEvent()),
                                  isLoading: state.status == ForgetPasswordStatus.loading,
                                  widget: Text(LocaleKeys.done.tr()),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                  )

                ],
              ),
            ],
          )
        ],
    );
  }
}

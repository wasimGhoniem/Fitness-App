import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/build_pin_code.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/resend_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';

class VerifyCodeWidget extends StatelessWidget {
  const VerifyCodeWidget({super.key});

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
                  text: LocaleKeys.otp_code.tr(),
                  style: TextTheme.of(context).titleSmall!.copyWith(
                      color: AppColorsLight.white,
                      fontSize: AppSizes.font_20,
                      fontWeight: FontWeight.w800
                  )
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_4),
              CustomText(
                text: LocaleKeys.enter_your_otp.tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: AppSizes.font_18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_20),
              GlassContainer(
                  width: MediaQuery.of(context).size.width,
                  body: [
                    Form(
                      key: viewModel.verifyCodeKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: BuildPinCode(
                              controller: viewModel.codeController,
                            ),
                          ),

                          const SizedBox(height: AppSizes.spaceBetweenItems_24),

                          BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: CustomElevatedButton(
                                      onPressed: () =>
                                          viewModel.doIntent(VerifyCodeEvent()),
                                      isLoading: state.status == ForgetPasswordStatus.loading,
                                      widget: Text(
                                        LocaleKeys.confirm.tr(),
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                  ),
                                );
                              }
                          ),
                          const SizedBox(height: AppSizes.spaceBetweenItems_8),
                          Text(
                            LocaleKeys.did_Not_Receive_Code.tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSizes.spaceBetweenItems_4),
                          TextButton(
                            onPressed: () {
                              viewModel.doIntent(ResendCodeEvent());
                            },
                            child: const ResendText(),
                          ),
                        ],
                      )
                    ),
                  ],
              ),
            ],
          ),
        ],
    );
  }
}

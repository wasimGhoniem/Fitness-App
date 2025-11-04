import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/build_email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel  = context.read<ForgetPasswordViewModel>();
    return GlassLayout(
        backGroundImage: Assets.assetsImagesAuthBg,
      body: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),

        Center(
          child: Image.asset(
            Assets.assetsIconsFitnessAppIcon,
            height: AppSizes.padding_100,
            width: AppSizes.padding_100,
          ),
        ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: LocaleKeys.enter_Email.tr(),
              style: TextTheme.of(context).labelSmall!.copyWith(
                color: AppColorsLight.white,
                fontSize: AppSizes.font_20,
                fontWeight: FontWeight.w400
              )
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_4),
            CustomText(
              text: LocaleKeys.forget_password.tr(),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.white,
                fontSize: AppSizes.font_28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_24),
            GlassContainer(
              width: MediaQuery.of(context).size.width,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding_30,
                vertical: AppSizes.padding_30
              ),
              body:[
                Form(
                  key: viewModel.forgetPasswordKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BuildEmailField(controller: viewModel.emailController),
                      const SizedBox(height: AppSizes.spaceBetweenItems_24),
                      BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 8,
                            ),
                            child: CustomElevatedButton(
                              onPressed: () =>
                                  viewModel.doIntent(SendForgetRequestEvent()),
                              isLoading: state.status == ForgetPasswordStatus.loading,
                              widget: Text(
                                LocaleKeys.send_OTP.tr(),
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: AppSizes.font_22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ]
        ),
      ]
    );
  }
}
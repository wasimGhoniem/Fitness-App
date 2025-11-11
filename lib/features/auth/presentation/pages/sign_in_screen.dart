import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/auth_redirect_widget.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signIn/build_header_section.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signIn/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final SignInViewModel _viewModel;

  @override
  void initState() {
    _viewModel = getIt<SignInViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: BlocListener<SignInViewModel, SignInState>(
        listener: (context, state) {
          if (state.failure != null && state.isLoading == false) {
            DialogueUtils.showMessage(
              context: context,
              message: state.failure!.errorMessage,
            );
          } else if (state.response != null && state.isLoading == false) {
            DialogueUtils.showMessage(
              context: context,
              message: LocaleKeys.welcome_back_message.tr(),
              posActionName: LocaleKeys.ok.tr(),
              title: LocaleKeys.success.tr(),
              posAction: () {
                context.pushReplacementNamed(AppRoutes.mainLayoutRoute);
              },
            );
          }
        },
        child: Scaffold(
          body: GlassLayout(
            backGroundImage: Assets.assetsImagesAuthBg,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.spaceBetweenItems_48),
                  BuildHeaderSection(
                    imagePath: Assets.assetsIconsFitnessAppIcon,
                    firstText: LocaleKeys.hey_there.tr(),
                    secondText: LocaleKeys.welcome_back.tr(),
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems_16),
                  GlassContainer(
                    width: double.infinity,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.padding_32,
                    ),
                    body: [
                      const SizedBox(height: AppSizes.spaceBetweenItems_24),
                      Text(
                        LocaleKeys.login.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_16),
                      SignInForm(viewModel: _viewModel),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //todo navigate to forget password},
                          },
                          child: Text(
                            LocaleKeys.forget_password.tr(),
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_40),
                      BlocBuilder<SignInViewModel, SignInState>(
                        builder: (context, state) {
                          return CustomElevatedButton(
                            onPressed: () {
                              _viewModel.doIntent(
                                SignInActionEvent(
                                  request: SignInRequestEntity(
                                    email: _viewModel.emailController.text,
                                    password:
                                        _viewModel.passwordController.text,
                                  ),
                                ),
                              );
                            },
                            isLoading: state.isLoading,
                            widget: Text(
                              LocaleKeys.login.tr(),
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceBetweenItems_8),
                      AuthRedirectTextSpan(
                        onTap: () {
                          context.pushNamed(AppRoutes.signUpRoute);
                        },
                        question: LocaleKeys.dont_have_an_account_yet.tr(),
                        action: LocaleKeys.register.tr(),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

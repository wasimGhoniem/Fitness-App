import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/auth_redirect_widget.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/button_bloc_consumer.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/custom_appbar.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
    required this.physicalLevel,
  });
  final String gender;
  final int age;
  final int weight;
  final int height;
  final String goal;
  final String physicalLevel;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late final SignupViewModel _signupViewModel;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _signupViewModel = getIt<SignupViewModel>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _signupViewModel,
      child: GlassLayout(
        backGroundImage: Assets.assetsImagesAuthBg,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.spaceBetweenItems_40),
                  const CustomAppBarr(),
                  const Spacer(),
                  CustomText(
                    text: LocaleKeys.hey_there.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                  CustomText(
                    text: LocaleKeys.create_an_account.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems_16),
                  GlassContainer(
                    width: double.infinity,
                    contentPadding: const EdgeInsetsGeometry.symmetric(
                      horizontal: AppSizes.padding_32,
                    ),
                    body: [
                      const SizedBox(height: AppSizes.spaceBetweenItems_24),
                      Text(
                        LocaleKeys.register.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_16),
                      FormWidget(
                        formKey: _formKey,
                        emailController: _emailController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_16),
                      AuthRedirectTextSpan(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signInRoute);
                        },
                        question: LocaleKeys.already_have_an_account.tr(),
                        action: LocaleKeys.login.tr(),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_16),
                      CustomElvatedButtonBlocConsumer(
                        emailController: _emailController,
                        firstNameController: _firstNameController,
                        passwordController: _passwordController,
                        lastNameController: _lastNameController,
                        formKey: _formKey,
                        widget: widget,
                        signupViewModel: _signupViewModel,
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_32),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems_32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

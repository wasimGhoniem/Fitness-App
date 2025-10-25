import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_events.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomElvatedButtonBlocConsumer extends StatelessWidget {
  const CustomElvatedButtonBlocConsumer({
    super.key,
    required TextEditingController emailController,
    required TextEditingController firstNameController,
    required TextEditingController passwordController,
    required TextEditingController lastNameController,
    required this.widget,
    required GlobalKey<FormState> formKey,
    required SignupViewModel signupViewModel,
  }) : _emailController = emailController,
       _firstNameController = firstNameController,
       _passwordController = passwordController,
       _lastNameController = lastNameController,
       _formKey = formKey,
       _signupViewModel = signupViewModel;

  final TextEditingController _emailController;
  final TextEditingController _firstNameController;
  final TextEditingController _passwordController;
  final TextEditingController _lastNameController;
  final SignUpWidget widget;
  final GlobalKey<FormState> _formKey;
  final SignupViewModel _signupViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupViewModel, SignUpState>(
      listenWhen: (p, c) =>
          p.signUpFailure != c.signUpFailure || p.isSucces != c.isSucces,
      listener: (context, state) {
        final hasError = state.signUpFailure != null && state.isSucces != true;
        final isSuccess = state.isSucces == true;
        if (hasError) {
          DialogueUtils.showMessage(
            context: context,
            message: state.signUpFailure!.errorMessage,
            title: LocaleKeys.error_title.tr(),
            posActionName: LocaleKeys.ok_button.tr(),
          );
        }
        if (isSuccess) {
          DialogueUtils.showMessage(
            context: context,
            message: LocaleKeys.account_created_successfully.tr(),
            title: LocaleKeys.success_title.tr(),
            posActionName: LocaleKeys.ok_button.tr(),
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: () {
            final SignUpReqModel signUpReqModel = SignUpReqModel(
              email: _emailController.text,
              firstName: _firstNameController.text,
              password: _passwordController.text,
              lastName: _lastNameController.text,
              rePassword: _passwordController.text,
              activityLevel: widget.physicalLevel,
              age: widget.age,
              gender: widget.gender,
              goal: widget.goal,
              height: widget.height,
              weight: widget.weight,
            );

            if (_formKey.currentState!.validate()) {
              _signupViewModel.doIntent(
                SignUpEvent(signUpReqModel: signUpReqModel),
              );
            }
          },
          isLoading: state.isLoading,
          widget: Text(
            LocaleKeys.register.tr(),
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w800),
          ),
        );
      },
    );
  }
}

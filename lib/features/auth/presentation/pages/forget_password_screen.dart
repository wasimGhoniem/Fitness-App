import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_view_model.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/forget_password_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/handle_state.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/reset_passsword_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/forgetPassword/verify_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordViewModel viewModel;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ForgetPasswordViewModel>();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            handleState(
                context: context,
                status: state.status,
                successMessage: getSuccessMessage(state),
                errorMessage: state.failure?.errorMessage.isNotEmpty == true
                  ? state.failure!.errorMessage
                  : LocaleKeys.unexpected_Error.tr(),
                onSuccess: () {
                  handleNavigation(
                      context: context,
                      state: state,
                      pageController: pageController
                  );
                }
            );
          },
          builder: (context, state) {
            return Scaffold(
                body: Center(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                        ForgetPasswordWidget(),
                        VerifyCodeWidget(),
                        ResetPasswordWidget(),
                    ],
                  ),
                ),
            );
          },
      ),
    );
  }

  void handleNavigation({
    required BuildContext context,
    required ForgetPasswordState state,
    required PageController pageController,
  }) {
    switch (state.step) {
      case ForgetPasswordStep.verify:
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        break;
      case ForgetPasswordStep.reset:
        if (state.resetResponse != null) {
          context.pop();
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        break;
      case ForgetPasswordStep.resend:
        break;
      case ForgetPasswordStep.forget:
        break;
    }
  }

  String getSuccessMessage(ForgetPasswordState state) {
    switch (state.step) {
      case ForgetPasswordStep.forget:
      case ForgetPasswordStep.verify:
      case ForgetPasswordStep.resend:
        return state.forgetResponse?.info ?? LocaleKeys.operation_Completed.tr();
      case ForgetPasswordStep.reset:
        if(state.resetResponse != null){
          return LocaleKeys.password_Reset_Successfully.tr();
        } else {
          return  LocaleKeys.code_Verified_Successfully.tr();
        }
      }
  }
}

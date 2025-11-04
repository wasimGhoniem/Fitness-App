import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:fitness_app/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:fitness_app/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/forgetPassword/forget_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordViewModel(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase
  ) : super(const ForgetPasswordState());
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  final forgetPasswordKey = GlobalKey<FormState>();
  final verifyCodeKey = GlobalKey<FormState>();
  final resetPasswordKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    codeController.dispose();
    return super.close();
  }

  Future<void> doIntent(ForgetPasswordEvent intent) async {
    switch (intent) {
      case SendForgetRequestEvent():
        await _sendForgetRequest(email: emailController.text);
        break;
      case VerifyCodeEvent():
        await _verifyCode(code: codeController.text);
        break;
      case ResendCodeEvent():
        await _resendCode();
        break;
      case ResetPasswordEvent():
        await _resetPassword(newPasswordController.text);
        break;
    }
  }

  Future<void> _sendForgetRequest({required String email}) async {
    if (forgetPasswordKey.currentState != null && !forgetPasswordKey.currentState!.validate()) {
      return;
    }
    if(state.email == null || state.email!.isEmpty){
      emit(state.copyWith(
        status: ForgetPasswordStatus.error,
        failure: ServerFailure(errorMessage: "Email not found"),
      ));
      return;
    }
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await _forgetPasswordUseCase.invoke(
      request: ForgetPasswordRequestEntity(email: email)
    );

    switch (result) {
      case ApiSuccessResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            step: ForgetPasswordStep.verify,
            status: ForgetPasswordStatus.success,
            email: email.isNotEmpty ? email : state.email,
            forgetResponse: result.data,
          ),
        );
        break;

      case ApiErrorResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.error,
            failure: result.failure,
          ),
        );
        break;
    }
  }

  Future<void> _verifyCode({required String code}) async {
    if (verifyCodeKey.currentState != null && !verifyCodeKey.currentState!.validate()) {
      return;
    }
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await _verifyResetCodeUseCase.invoke(
      resetCode: VerifyResetCodeRequestEntity(resetCode: code),
    );

    switch (result) {
      case ApiSuccessResult<VerifyResetCodeResponseEntity>():
        emit(
          state.copyWith(
            step: ForgetPasswordStep.reset,
            status: ForgetPasswordStatus.success,
            verifyResponse: result.data,
            forgetResponse: null,
          ),
        );
        break;

      case ApiErrorResult<VerifyResetCodeResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.error,
            failure: result.failure,
          ),
        );
        break;
    }
  }

  Future<void> _resendCode() async {
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await _forgetPasswordUseCase.invoke(
      request: ForgetPasswordRequestEntity(email: state.email!),
    );

    switch (result) {
      case ApiSuccessResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.success,
            forgetResponse: result.data,
            step: ForgetPasswordStep.verify,
          ),
        );
        break;

      case ApiErrorResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.error,
            failure: result.failure,
          ),
        );
        break;
    }
  }

  Future<void> _resetPassword(String newPassword) async {
    if (resetPasswordKey.currentState != null && !resetPasswordKey.currentState!.validate()) {
      return;
    }
    if(state.email == null){
      emit(state.copyWith(
        status: ForgetPasswordStatus.error,
        failure:  ServerFailure(errorMessage: 'Email is missing')
      ));
      return;
    }
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await _resetPasswordUseCase.invoke(
      request: ResetPasswordRequestEntity(email: state.email!, newPassword: newPassword),
    );

    switch (result) {
      case ApiSuccessResult<ResetPasswordResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.success,
            resetResponse: result.data,
            forgetResponse: null,
          ),
        );
        break;

      case ApiErrorResult<ResetPasswordResponseEntity>():
        emit(
          state.copyWith(
            status: ForgetPasswordStatus.error,
            failure: result.failure,
          ),
        );
        break;
    }
  }
}
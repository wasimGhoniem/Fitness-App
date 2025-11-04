import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';

enum ForgetPasswordStep { forget, verify, reset, resend }

enum ForgetPasswordStatus { initial, loading, success, error }

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.step = ForgetPasswordStep.forget,
    this.status = ForgetPasswordStatus.initial,
    this.failure,
    this.email,
    this.forgetResponse,
    this.verifyResponse,
    this.resetResponse,
  });

  final ForgetPasswordStep step;
  final ForgetPasswordStatus status;
  final Failure? failure;
  final String? email;
  final ForgetPasswordResponseEntity? forgetResponse;
  final VerifyResetCodeResponseEntity? verifyResponse;
  final ResetPasswordResponseEntity? resetResponse;

  ForgetPasswordState copyWith({
    ForgetPasswordStep? step,
    ForgetPasswordStatus? status,
    Failure? failure,
    String? email,
    ForgetPasswordResponseEntity? forgetResponse,
    VerifyResetCodeResponseEntity? verifyResponse,
    ResetPasswordResponseEntity? resetResponse,
  }) {
    return ForgetPasswordState(
      step: step ?? this.step,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      email: email ?? this.email,
      forgetResponse: forgetResponse ?? this.forgetResponse,
      verifyResponse: verifyResponse ?? this.verifyResponse,
      resetResponse: resetResponse ?? this.resetResponse,
    );
  }

  @override
  List<Object?> get props => [
    step,
    status,
    failure,
    email,
    forgetResponse,
    verifyResponse,
    resetResponse,
  ];
}
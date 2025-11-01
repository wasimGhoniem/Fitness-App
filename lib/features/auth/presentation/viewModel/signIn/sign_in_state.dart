import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';

class SignInState {
  SignInState({
    this.failure,
    this.isLoading = false,
    this.response,
  });

  final Failure? failure;
  final SignInResponseEntity? response;
  final bool isLoading;

  SignInState copyWith({
    Failure? failure,
    SignInResponseEntity? response,
    bool? isLoading,
  }) {
    return SignInState(
      failure: failure ?? this.failure,
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

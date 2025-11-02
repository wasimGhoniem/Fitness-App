import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';

class SignInState {
  SignInState({
    this.failure,
    this.storageFailure,
    this.isLoading = false,
    this.response,
  });

  final Failure? failure;
  final Failure? storageFailure;
  final SignInResponseEntity? response;
  final bool isLoading;

  SignInState copyWith({
    Failure? failure,
    Failure? storageFailure,
    SignInResponseEntity? response,
    bool? isLoading,
  }) {
    return SignInState(
      failure: failure ?? this.failure,
      storageFailure: storageFailure ?? this.storageFailure,
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.isLoading = false,
    this.signUpFailure,
    this.isSucces = false,
  });
  final bool isLoading;
  final Failure? signUpFailure;
  final bool isSucces;

  SignUpState copyWith({
    bool? isLoading,
    Failure? signUpFailure,
    bool? isSucces,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      signUpFailure: signUpFailure ?? this.signUpFailure,
      isSucces: isSucces ?? this.isSucces,
    );
  }

  @override
  List<Object?> get props => [isLoading, signUpFailure, isSucces];
}

import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.isLoading = false,
    this.failure,
    this.resetPasswordSuccess = false,
    this.resetPasswordEntity,
    this.storgeFailure,
  });
  final bool isLoading;
  final Failure? failure;
  final Failure? storgeFailure;
  final bool resetPasswordSuccess;
  final ChangePasswordEntity? resetPasswordEntity;

  ChangePasswordState copyWith({
    bool? isLoading,
    Failure? failure,
    bool? resetPasswordSuccess,
    ChangePasswordEntity? resetPasswordEntity,
    Failure? storgeFailure,
  }) {
    return ChangePasswordState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
      resetPasswordSuccess: resetPasswordSuccess ?? this.resetPasswordSuccess,
      resetPasswordEntity: resetPasswordEntity ?? this.resetPasswordEntity,
      storgeFailure: storgeFailure ?? this.storgeFailure,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    failure,
    resetPasswordSuccess,
    resetPasswordEntity,
    storgeFailure,
  ];
}

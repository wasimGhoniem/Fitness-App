import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/useCases/sign_in_use_case.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  SignInViewModel(this._signInUseCase) : super(SignInState());
  final SignInUseCase _signInUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final signInKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    PasswordController.dispose();
    emailController.dispose();
    return super.close();
  }

  Future<void> doIntent(SignInEvent event) async {
    switch (event) {
      case SignInActionEvent():
        await _signIn(request: event.request);
    }
  }

  Future<void> _signIn({required SignInRequestEntity request}) async {
    if (!signInKey.currentState!.validate()) {
      return;
    }
    emit(state.copyWith(isLoading: true));

    final result = await _signInUseCase.invoke(request);
    switch (result) {
      case ApiSuccessResult<SignInResponseEntity>():
        emit(state.copyWith(isLoading: false, response: result.data));
        break;
      case ApiErrorResult<SignInResponseEntity>():
        emit(state.copyWith(isLoading: false, failure: result.failure));
        break;
    }
  }
}

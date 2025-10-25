import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_events.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewModel extends Cubit<SignUpState> {
  SignupViewModel(this._signUpUseCase) : super(const SignUpState());
  final SignUpUseCase _signUpUseCase;

  Future<void> doIntent(SignUpEvents event) async {
    switch (event) {
      case SignUpEvent(signUpReqModel: final signUpReqModel):
        await _signUp(signUpRequestModel: signUpReqModel);
    }
  }

  Future<void> _signUp({required SignUpReqModel signUpRequestModel}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _signUpUseCase.invoke(
      signUpReqModel: signUpRequestModel,
    );
    switch (result) {
      case ApiSuccessResult<void>():
        emit(state.copyWith(isLoading: false, isSucces: true));

      case ApiErrorResult<void>():
        emit(state.copyWith(isLoading: false, signUpFailure: result.failure));
    }
  }
}

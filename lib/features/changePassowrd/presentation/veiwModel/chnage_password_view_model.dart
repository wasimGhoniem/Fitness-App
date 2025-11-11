import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/useCases/write_token_use_case.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';
import 'package:fitness_app/features/changePassowrd/domain/use_cases/chnage_password_use_case.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/change_password_event.dart';
import 'package:fitness_app/features/changePassowrd/presentation/veiwModel/change_password_stats.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  ChangePasswordViewModel(this._changePasswordUseCase, this._writeTokenUseCase)
    : super(const ChangePasswordState());
  final ChangePasswordUseCase _changePasswordUseCase;
  final WriteTokenUseCase _writeTokenUseCase;

  Future<void> doIntent({
    required ChangePasswordEvents event,
    required ChangePasswordRequestModel changePasswordRequestModel,
  }) async {
    switch (event) {
      case ChangePasswordEvent():
        await resetPasswordFlow(
          changePasswordRequestModel: changePasswordRequestModel,
        );
    }
  }

  Future<void> _resetPassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _changePasswordUseCase.invoke(
      changePasswordRequestModel,
    );

    switch (result) {
      case ApiSuccessResult<ChangePasswordEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            resetPasswordSuccess: true,
            resetPasswordEntity: result.data,
          ),
        );

      case ApiErrorResult<ChangePasswordEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            failure: result.failure,
            resetPasswordSuccess: false,
          ),
        );
    }
  }

  Future<void> writeToken({required String token}) async {
    final result = await _writeTokenUseCase.invoke(token: token);
    switch (result) {
      case ApiSuccessResult<void>():
        return;
      case ApiErrorResult<void>():
        emit(state.copyWith(storgeFailure: result.failure));
    }
  }

  Future<void> resetPasswordFlow({
    required ChangePasswordRequestModel changePasswordRequestModel,
  }) async {
    await _resetPassword(changePasswordRequestModel);

    if (state.resetPasswordEntity?.token != null &&
        state.resetPasswordEntity!.token.isNotEmpty) {
      await writeToken(token: state.resetPasswordEntity!.token);
    }
  }
}

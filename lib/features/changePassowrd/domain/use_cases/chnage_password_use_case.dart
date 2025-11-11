import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';
import 'package:fitness_app/features/changePassowrd/domain/repositories/chnage_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordUseCase(this._changePasswordRepo);

  final ChangePasswordRepo _changePasswordRepo;

  Future<ApiResult<ChangePasswordEntity>> invoke(
    ChangePasswordRequestModel resetPasswordRequestModel,
  ) {
    return _changePasswordRepo.resetPassword(resetPasswordRequestModel);
  }
}

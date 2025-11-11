import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';

abstract interface class ChangePasswordRepo {
  Future<ApiResult<ChangePasswordEntity>> resetPassword(
    ChangePasswordRequestModel resetPasswordRequestModel,
  );
  Future<ApiResult<void>> writeToken({required String token});
}

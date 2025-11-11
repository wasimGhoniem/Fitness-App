import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';

abstract interface class ChangePasswordRemoteDataSource {
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  );
}

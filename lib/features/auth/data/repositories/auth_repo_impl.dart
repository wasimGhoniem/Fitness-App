import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;
  // ignore: unused_field
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request
  ) {
    return _authRemoteDataSource.forgetPassword(request);
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request
  ) {
    return _authRemoteDataSource.resetPassword(request);
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request
  ) {
    return _authRemoteDataSource.verifyResetCode(request);
  }
}

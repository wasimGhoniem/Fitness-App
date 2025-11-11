import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/data/dataSources/change_password_data_source.dart';
import 'package:fitness_app/features/changePassowrd/data/dataSources/change_password_local_data_source.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';
import 'package:fitness_app/features/changePassowrd/domain/repositories/chnage_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepo)
class ResetPasswordRepoImpl implements ChangePasswordRepo {
  ResetPasswordRepoImpl(
    this._changePasswordRemoteDataSource,
    this._changePasswordLocalDataSource,
  );

  final ChangePasswordRemoteDataSource _changePasswordRemoteDataSource;
  final ChangePasswordLocalDataSource _changePasswordLocalDataSource;

  @override
  Future<ApiResult<ChangePasswordEntity>> resetPassword(
    ChangePasswordRequestModel resetPasswordRequestModel,
  ) {
    return _changePasswordRemoteDataSource.changePassword(
      resetPasswordRequestModel,
    );
  }

  @override
  Future<ApiResult<void>> writeToken({required String token}) async {
    return await _changePasswordLocalDataSource.WriteToken(token: token);
  }
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/changePassowrd/data/dataSources/change_password_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordLocalDataSource)
class ResetPasswordLocalDataSourceImpl
    implements ChangePasswordLocalDataSource {
  ResetPasswordLocalDataSourceImpl(
    @Named(AppConstants.secureStorage) this._storage,
  );
  final Storage _storage;
  @override
  Future<ApiResult<void>> WriteToken({required String token}) async {
    try {
      await _storage.write(key: AppConstants.token, value: token);
      return ApiSuccessResult<void>(data: null);
    } catch (e) {
      final Failure failure = Failure(errorMessage: e.toString());
      return ApiErrorResult<void>(failure: failure);
    }
  }
}

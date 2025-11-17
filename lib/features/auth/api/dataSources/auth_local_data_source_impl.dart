import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(@Named(AppConstants.secureStorage) this._storage);

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

  @override
  Future<ApiResult<void>> deleteToken() async {
    try {
      await _storage.delete(key: AppConstants.token);
      return ApiSuccessResult<void>(data: null);
    } catch (e) {
      final Failure failure = Failure(errorMessage: e.toString());
      return ApiErrorResult<void>(failure: failure);
    }
  }
}

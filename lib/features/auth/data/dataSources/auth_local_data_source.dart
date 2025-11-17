import 'package:fitness_app/core/errors/api_results.dart';

abstract interface class AuthLocalDataSource {
  Future<ApiResult<void>> WriteToken({required String token});

  Future<ApiResult<void>> deleteToken();
}

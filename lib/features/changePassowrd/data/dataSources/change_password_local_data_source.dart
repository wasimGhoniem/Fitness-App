import 'package:fitness_app/core/errors/api_results.dart';

abstract interface class ChangePasswordLocalDataSource {
  Future<ApiResult<void>> WriteToken({required String token});
}

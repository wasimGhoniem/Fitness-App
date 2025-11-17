import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';

abstract class ProfileMainRemoteDataSource {
  Future<ApiResult<LoggedUserDataResponseEntity>> getLoggedUserData();
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';
import 'package:fitness_app/features/profileMain/domain/repositories/profile_main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserUseCase {
  GetLoggedUserUseCase(this._profileRepo);

  final ProfileMainRepo _profileRepo;

  Future<ApiResult<LoggedUserDataResponseEntity>> invoke() async {
    return await _profileRepo.getLoggedUserData();
  }
}

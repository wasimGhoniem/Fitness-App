import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProfileDataUseCase {
  GetProfileDataUseCase(this._exploreRepo);

  final ExploreRepo _exploreRepo;

  Future<ApiResult<ProfileDataResponseEntity>> call() {
    return _exploreRepo.getProfileData();
  }
}

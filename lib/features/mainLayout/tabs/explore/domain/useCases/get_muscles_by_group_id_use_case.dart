import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMusclesByGroupIdUseCase {
  GetMusclesByGroupIdUseCase(this._exploreRepo);

  final ExploreRepo _exploreRepo;

  Future<ApiResult<MuscleGroupDetailsResponseEntity>> call({
    required String groupId,
  }) {
    return _exploreRepo.getMusclesByGroupId(groupId);
  }
}

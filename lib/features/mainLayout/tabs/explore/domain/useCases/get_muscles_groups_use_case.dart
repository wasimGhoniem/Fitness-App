import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMusclesGroupsUseCase {
  GetMusclesGroupsUseCase(this._exploreRepo);

  final ExploreRepo _exploreRepo;

  Future<ApiResult<MusclesGroupsResponseEntity>> call() {
    return _exploreRepo.getMusclesGroups();
  }
}

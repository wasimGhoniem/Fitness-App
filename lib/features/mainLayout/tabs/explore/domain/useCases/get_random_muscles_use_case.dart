import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRandomMusclesUseCase {
  GetRandomMusclesUseCase(this._exploreRepo);

  final ExploreRepo _exploreRepo;

  Future<ApiResult<MuscleResponseEntity>> call() {
    return _exploreRepo.getRandomMuscles();
  }
}

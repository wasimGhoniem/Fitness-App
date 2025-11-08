import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/repositories/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDifficultyLevelsUseCase {
  GetDifficultyLevelsUseCase(this._exerciseRepo);

  final ExerciseRepo _exerciseRepo;

  Future<ApiResult<DifficultyLevelsResponseEntity>> call(String muscleId) {
    return _exerciseRepo.getDifficultyLevels(muscleId);
  }
}

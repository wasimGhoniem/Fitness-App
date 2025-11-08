import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/repositories/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetExercisesByMuscleAndDifficultyUseCase {
  GetExercisesByMuscleAndDifficultyUseCase(this._exerciseRepo);

  final ExerciseRepo _exerciseRepo;

  Future<ApiResult<ExercisesResponseEntity>> call({
    required String muscleId,
    required String difficultyId,
    required int page,
  }) {
    return _exerciseRepo.getExercisesByMuscleAndDifficulty(
      muscleId,
      difficultyId,
      page,
    );
  }
}

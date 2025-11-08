import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';

abstract interface class ExerciseRemoteDataSource {
  Future<ApiResult<DifficultyLevelsResponseEntity>> getDifficultyLevels(
    String muscleId,
  );

  Future<ApiResult<ExercisesResponseEntity>> getExercisesByMuscleAndDifficulty(
    String muscleId,
    String difficultyId,
    int page,
  );
}

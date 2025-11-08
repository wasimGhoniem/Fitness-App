import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/exercise/data/dataSources/exercise_remote_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/repositories/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo {
  ExerciseRepoImpl(this._remoteDataSource);

  final ExerciseRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<DifficultyLevelsResponseEntity>> getDifficultyLevels(
    String muscleId,
  ) {
    return _remoteDataSource.getDifficultyLevels(muscleId);
  }

  @override
  Future<ApiResult<ExercisesResponseEntity>> getExercisesByMuscleAndDifficulty(
    String muscleId,
    String difficultyId,
    int page,
  ) {
    return _remoteDataSource.getExercisesByMuscleAndDifficulty(
      muscleId,
      difficultyId,
      page,
    );
  }
}

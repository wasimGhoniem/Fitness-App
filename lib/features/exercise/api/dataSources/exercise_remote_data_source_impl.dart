import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/exercise/api/client/exercise_api_service.dart';
import 'package:fitness_app/features/exercise/api/mappers/difficulty_levels_response_mapper.dart';
import 'package:fitness_app/features/exercise/api/mappers/exercises_response_mapper.dart';
import 'package:fitness_app/features/exercise/api/models/difficulty_levels_response_dto.dart';
import 'package:fitness_app/features/exercise/api/models/exercises_response_dto.dart';
import 'package:fitness_app/features/exercise/data/dataSources/exercise_remote_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExerciseRemoteDataSource)
class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  ExerciseRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final ExerciseApiService _apiService;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<DifficultyLevelsResponseEntity>> getDifficultyLevels(
    String muscleId,
  ) {
    return _remoteExecutor
        .execute<DifficultyLevelsResponseDto, DifficultyLevelsResponseEntity>(
          request: () => _apiService.getDifficultyLevels(muscleId),
          mapper: (dto) => dto.toEntity(),
        );
  }

  @override
  Future<ApiResult<ExercisesResponseEntity>> getExercisesByMuscleAndDifficulty(
    String muscleId,
    String difficultyId,
    int page,
  ) {
    return _remoteExecutor
        .execute<ExercisesResponseDto, ExercisesResponseEntity>(
          request: () => _apiService.getExercisesByMuscleAndDifficulty(
            muscleId,
            difficultyId,
            page,
          ),
          mapper: (dto) => dto.toEntity(),
        );
  }
}

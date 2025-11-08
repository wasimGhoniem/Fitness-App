import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/exercise/api/models/difficulty_levels_response_dto.dart';
import 'package:fitness_app/features/exercise/api/models/exercises_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'exercise_api_service.g.dart';

@singleton
@RestApi()
abstract class ExerciseApiService {
  @factoryMethod
  factory ExerciseApiService(@Named(ApiConstants.fitnessDio) Dio dio) =
      _ExerciseApiService;

  @GET(ApiConstants.difficultyLevelsEndpoint)
  Future<DifficultyLevelsResponseDto> getDifficultyLevels(
    @Query(ApiConstants.primeMoverMuscleIdParam) String muscleId,
  );

  @GET(ApiConstants.exercisesByMuscleAndDifficultyEndpoint)
  Future<ExercisesResponseDto> getExercisesByMuscleAndDifficulty(
    @Query(ApiConstants.primeMoverMuscleIdParam) String muscleId,
    @Query(ApiConstants.difficultyLevelIdParam) String difficultyId,
    @Query(ApiConstants.page) int page,
  );
}

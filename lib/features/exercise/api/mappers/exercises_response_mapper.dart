import 'package:fitness_app/features/exercise/api/mappers/exercise_mapper.dart';
import 'package:fitness_app/features/exercise/api/models/exercises_response_dto.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';

extension ExercisesResponseMapper on ExercisesResponseDto {
  ExercisesResponseEntity toEntity() {
    return ExercisesResponseEntity(
      message: message ?? '',
      totalPages: totalPages ?? 0,
      currentPage: currentPage ?? 0,
      exercises: (exercises ?? const []).toEntity(),
    );
  }
}

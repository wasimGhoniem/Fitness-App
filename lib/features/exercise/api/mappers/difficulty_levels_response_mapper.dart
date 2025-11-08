import 'package:fitness_app/features/exercise/api/mappers/difficulty_level_mapper.dart';
import 'package:fitness_app/features/exercise/api/models/difficulty_levels_response_dto.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';

extension DifficultyLevelsResponseMapper on DifficultyLevelsResponseDto {
  DifficultyLevelsResponseEntity toEntity() {
    return DifficultyLevelsResponseEntity(
      message: message ?? '',
      difficultyLevels: (difficultyLevels ?? const []).toEntity(),
    );
  }
}

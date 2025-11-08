import 'package:fitness_app/features/exercise/api/models/difficulty_level_dto.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_level_entity.dart';

extension DifficultyLevelMapper on DifficultyLevelDto {
  DifficultyLevelEntity toEntity() {
    return DifficultyLevelEntity(id: id ?? '', name: name ?? '');
  }
}

extension DifficultyLevelListMapper on List<DifficultyLevelDto> {
  List<DifficultyLevelEntity> toEntity() {
    return map((dto) => dto.toEntity()).toList();
  }
}

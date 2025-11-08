import 'package:fitness_app/features/exercise/domain/entities/difficulty_level_entity.dart';

class DifficultyLevelsResponseEntity {
  const DifficultyLevelsResponseEntity({
    required this.message,
    required this.difficultyLevels,
  });

  final String message;
  final List<DifficultyLevelEntity> difficultyLevels;
}

import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';

class MuscleGroupDetailsResponseEntity {
  MuscleGroupDetailsResponseEntity({
    required this.message,
    required this.muscleGroup,
    required this.muscles,
  });

  final String message;
  final MuscleGroupEntity muscleGroup;
  final List<MuscleEntity> muscles;
}

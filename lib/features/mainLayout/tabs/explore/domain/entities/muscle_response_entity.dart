import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';

class MuscleResponseEntity {
  MuscleResponseEntity({
    required this.message,
    required this.totalMuscles,
    required this.muscles,
  });
  final String message;
  final int totalMuscles;
  final List<MuscleEntity> muscles;
}

import 'package:fitness_app/features/exercise/domain/entities/exercise_entity.dart';

class ExercisesResponseEntity {
  const ExercisesResponseEntity({
    required this.message,
    required this.exercises,
    required this.totalPages,
    required this.currentPage,
  });

  final String message;
  final int totalPages;
  final int currentPage;
  final List<ExerciseEntity> exercises;
}

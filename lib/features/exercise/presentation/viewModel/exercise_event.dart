sealed class ExerciseEvent {}

class GetDifficultyLevelsEvent extends ExerciseEvent {
  GetDifficultyLevelsEvent({required this.muscleId});
  final String muscleId;
}

class GetExercisesEvent extends ExerciseEvent {
  GetExercisesEvent({
    required this.muscleId,
    required this.difficultyId,
    this.page = 1,
  });
  final String muscleId;
  final String difficultyId;
  final int? page;
}

class LoadMoreExercisesEvent extends ExerciseEvent {}

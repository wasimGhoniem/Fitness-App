import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';

class ExerciseState extends Equatable {
  const ExerciseState({
    this.difficultyLevelsResponseEntity,
    this.isDifficultyLevelsLoading = true,
    this.difficultyLevelsFailure,
    this.exercisesResponseEntity,
    this.isExercisesLoading = true,
    this.exercisesFailure,

    this.isLoadingMoreExercises = false,
  });

  final DifficultyLevelsResponseEntity? difficultyLevelsResponseEntity;
  final bool isDifficultyLevelsLoading;
  final Failure? difficultyLevelsFailure;
  final ExercisesResponseEntity? exercisesResponseEntity;
  final bool isExercisesLoading;
  final bool isLoadingMoreExercises;
  final Failure? exercisesFailure;

  ExerciseState copyWith({
    DifficultyLevelsResponseEntity? difficultyLevelsResponseEntity,
    bool? isDifficultyLevelsLoading,
    Failure? difficultyLevelsFailure,
    ExercisesResponseEntity? exercisesResponseEntity,
    bool? isExercisesLoading,
    Failure? exercisesFailure,
    bool? isLoadingMoreExercises,
  }) {
    return ExerciseState(
      difficultyLevelsResponseEntity:
          difficultyLevelsResponseEntity ?? this.difficultyLevelsResponseEntity,
      isDifficultyLevelsLoading:
          isDifficultyLevelsLoading ?? this.isDifficultyLevelsLoading,
      difficultyLevelsFailure:
          difficultyLevelsFailure ?? this.difficultyLevelsFailure,
      exercisesResponseEntity:
          exercisesResponseEntity ?? this.exercisesResponseEntity,
      isExercisesLoading: isExercisesLoading ?? this.isExercisesLoading,
      exercisesFailure: exercisesFailure ?? this.exercisesFailure,

      isLoadingMoreExercises:
          isLoadingMoreExercises ?? this.isLoadingMoreExercises,
    );
  }

  @override
  List<Object?> get props => [
    difficultyLevelsResponseEntity,
    isDifficultyLevelsLoading,
    difficultyLevelsFailure,
    exercisesResponseEntity,
    isExercisesLoading,
    exercisesFailure,
    isLoadingMoreExercises,
  ];
}

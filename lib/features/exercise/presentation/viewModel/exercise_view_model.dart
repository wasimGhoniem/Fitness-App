import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_levels_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercises_response_entity.dart';
import 'package:fitness_app/features/exercise/domain/useCases/get_difficulty_levels_use_case.dart';
import 'package:fitness_app/features/exercise/domain/useCases/get_exercises_by_muscle_and_difficulty_use_case.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_event.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExerciseViewModel extends Cubit<ExerciseState> {
  ExerciseViewModel(this._getDifficultyLevelsUseCase, this._getExercisesUseCase)
    : super(const ExerciseState());
  final GetDifficultyLevelsUseCase _getDifficultyLevelsUseCase;
  final GetExercisesByMuscleAndDifficultyUseCase _getExercisesUseCase;
  String muscleId = '';
  String difficultyId = '';

  void doIntent(ExerciseEvent event) {
    switch (event) {
      case GetDifficultyLevelsEvent(muscleId: final muscleId):
        _getDifficultyLevels(muscleId);
      case GetExercisesEvent(
        muscleId: final muscleId,
        difficultyId: final difficultyId,
        page: final page,
      ):
        _getExercises(
          difficultyId: difficultyId,
          muscleId: muscleId,
          page: page!,
        );
      case LoadMoreExercisesEvent():
        _loadMoreExercises();
    }
  }

  Future<void> _getDifficultyLevels(String muscleId) async {
    final result = await _getDifficultyLevelsUseCase.call(muscleId);
    switch (result) {
      case ApiSuccessResult<DifficultyLevelsResponseEntity>():
        emit(
          state.copyWith(
            isDifficultyLevelsLoading: false,
            difficultyLevelsResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<DifficultyLevelsResponseEntity>():
        emit(
          state.copyWith(
            isDifficultyLevelsLoading: false,
            difficultyLevelsFailure: result.failure,
          ),
        );
    }
  }

  Future<void> _getExercises({
    required String muscleId,
    required String difficultyId,
    required int page,
  }) async {
    this.muscleId = muscleId;
    this.difficultyId = difficultyId;
    emit(state.copyWith(isExercisesLoading: true));
    final result = await _getExercisesUseCase.call(
      difficultyId: muscleId,
      muscleId: difficultyId,
      page: page,
    );
    switch (result) {
      case ApiSuccessResult<ExercisesResponseEntity>():
        emit(
          state.copyWith(
            isExercisesLoading: false,
            exercisesResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<ExercisesResponseEntity>():
        emit(
          state.copyWith(
            isExercisesLoading: false,
            exercisesFailure: result.failure,
          ),
        );
    }
  }

  Future<void> _loadMoreExercises() async {
    final int currentPage = state.exercisesResponseEntity!.currentPage;
    final int totalPages = state.exercisesResponseEntity!.totalPages;
    if (currentPage < totalPages) {
      emit(state.copyWith(isLoadingMoreExercises: true));
      final result = await _getExercisesUseCase.call(
        difficultyId: muscleId,
        muscleId: difficultyId,
        page: currentPage + 1,
      );
      switch (result) {
        case ApiSuccessResult<ExercisesResponseEntity>():
          final ExercisesResponseEntity entity = mergeExercisesResponse(result);
          emit(
            state.copyWith(
              isLoadingMoreExercises: false,
              exercisesResponseEntity: entity,
            ),
          );
        case ApiErrorResult<ExercisesResponseEntity>():
          emit(
            state.copyWith(
              isLoadingMoreExercises: false,
              exercisesFailure: result.failure,
            ),
          );
      }
    }
  }

  ExercisesResponseEntity mergeExercisesResponse(
    ApiSuccessResult<ExercisesResponseEntity> result,
  ) {
    final oldList = state.exercisesResponseEntity!.exercises;
    final newList = result.data.exercises;
    final finalList = [...oldList, ...newList];
    final ExercisesResponseEntity entity = ExercisesResponseEntity(
      exercises: finalList,
      currentPage: result.data.currentPage,
      totalPages: result.data.totalPages,
      message: result.data.message,
    );
    return entity;
  }
}

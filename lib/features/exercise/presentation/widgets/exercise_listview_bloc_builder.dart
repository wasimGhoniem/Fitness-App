import 'package:fitness_app/core/dummy/dummy_data.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_state.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseListViewBlocBuilder extends StatelessWidget {
  const ExerciseListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseViewModel, ExerciseState>(
      builder: (context, state) {
        if (state.isExercisesLoading) {
          return ExerciseListView(
            isPaginationLoading: state.isLoadingMoreExercises,
            exercises: exerciseDummyList,
            isLoading: state.isExercisesLoading,
          );
        }

        if (state.exercisesFailure != null) {
          return Text(state.exercisesFailure!.errorMessage);
        }

        return ExerciseListView(
          isPaginationLoading: state.isLoadingMoreExercises,
          exercises: state.exercisesResponseEntity!.exercises,
          isLoading: state.isExercisesLoading,
        );
      },
    );
  }
}

import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_event.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_state.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/work_outs_taps.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/tabs_shimmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarBlocBuilder extends StatelessWidget {
  const TabBarBlocBuilder({
    super.key,
    required this.exerciseModel,
    required this.exerciseViewModel,
  });
  final ExerciseModel exerciseModel;
  final ExerciseViewModel exerciseViewModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseViewModel, ExerciseState>(
      listener: (context, state) {
        if (state.difficultyLevelsResponseEntity != null &&
            state.difficultyLevelsResponseEntity!.difficultyLevels.isNotEmpty &&
            state.exercisesResponseEntity == null &&
            !state.isDifficultyLevelsLoading &&
            state.difficultyLevelsFailure == null) {
          final firstLevelId =
              state.difficultyLevelsResponseEntity!.difficultyLevels.first.id;
          exerciseViewModel.doIntent(
            GetExercisesEvent(
              muscleId: firstLevelId,
              difficultyId: exerciseModel.id,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.isDifficultyLevelsLoading) {
          return const TabsShimmerEffectWidget();
        }

        if (state.difficultyLevelsFailure != null) {
          return Text(state.difficultyLevelsFailure!.errorMessage);
        }

        return WorkOutsTaps(
          difficultyLevels:
              state.difficultyLevelsResponseEntity!.difficultyLevels,
          exerciseModel: exerciseModel,
          exerciseViewModel: exerciseViewModel,
        );
      },
    );
  }
}

import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/exercise/domain/entities/difficulty_level_entity.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_event.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:flutter/material.dart';

class WorkOutsTaps extends StatelessWidget {
  const WorkOutsTaps({
    super.key,
    required this.difficultyLevels,
    required this.exerciseModel,
    required this.exerciseViewModel,
  });
  final List<DifficultyLevelEntity> difficultyLevels;
  final ExerciseModel exerciseModel;
  final ExerciseViewModel exerciseViewModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: difficultyLevels.length,
      child: TabBar(
        onTap: (index) {
          exerciseViewModel.doIntent(
            GetExercisesEvent(
              muscleId: difficultyLevels[index].id,
              difficultyId: exerciseModel.id,
            ),
          );
        },
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
        isScrollable: true,
        tabs: difficultyLevels.map((level) => Tab(text: level.name)).toList(),
      ),
    );
  }
}

import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/widgets/work_outs_grid_item.dart';
import 'package:flutter/material.dart';

class WorkOutGridView extends StatelessWidget {
  const WorkOutGridView({super.key, required this.muscles});

  final List<MuscleEntity> muscles;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.spaceBetweenItems_16,
        mainAxisSpacing: AppSizes.spaceBetweenItems_16,
      ),
      itemCount: muscles.length,
      itemBuilder: (context, index) {
        final muscle = muscles[index];
        final args = ExerciseModel(
          id: muscle.id,
          name: muscle.name,
          image: muscle.image,
        );
        return GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.exerciseRoute, arguments: args);
          },
          child: WorkOutsGridItem(
            mealName: muscle.name,
            mealPhoto: muscle.image,
          ),
        );
      },
    );
  }
}

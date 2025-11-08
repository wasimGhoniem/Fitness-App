import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscle_group_by_id_list_view_item.dart';
import 'package:flutter/material.dart';

class MusclesGroupByIdListVieww extends StatelessWidget {
  const MusclesGroupByIdListVieww({
    super.key,
    required this.isLoading,
    required this.musclesList,
  });
  final bool isLoading;
  final List<MuscleEntity> musclesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
        itemCount: musclesList.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSizes.spaceBetweenItems_16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            final ExerciseModel exerciseModel = ExerciseModel(
              id: musclesList[index].id,
              name: musclesList[index].name,
              image: musclesList[index].image,
            );
            context.pushNamed(
              AppRoutes.exerciseRoute,
              arguments: exerciseModel,
            );
          },
          child: MusclesGroupIdListViewItem(
            muscleEntity: musclesList[index],
            isLoading: isLoading,
          ),
        ),
      ),
    );
  }
}

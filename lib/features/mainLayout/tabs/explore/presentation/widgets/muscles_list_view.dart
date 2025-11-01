import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscles_list_view_item.dart';
import 'package:flutter/material.dart';

class MusclesListVieww extends StatelessWidget {
  const MusclesListVieww({
    super.key,
    required this.isLoading,
    required this.musclesList,
  });
  final bool isLoading;
  final List<MuscleEntity> musclesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
        itemCount: musclesList.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSizes.spaceBetweenItems_16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => MusclesListViewItem(
          muscleEntity: musclesList[index],
          isLoading: isLoading,
        ),
      ),
    );
  }
}

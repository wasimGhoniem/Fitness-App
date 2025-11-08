import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_event.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutsTaps extends StatelessWidget {
  const WorkOutsTaps({super.key, required this.musclesGroup});
  final List<MuscleGroupEntity> musclesGroup;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: musclesGroup.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            onTap: (imdex) => context.read<ExploreViewModel>().doIntent(
              GetMusclesByGroupIdEvent(id: musclesGroup[imdex].id),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding_16,
            ),
            isScrollable: true,
            tabs: musclesGroup.map((muscle) => Tab(text: muscle.name)).toList(),
          ),
        ],
      ),
    );
  }
}

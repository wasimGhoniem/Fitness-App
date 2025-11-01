import 'package:fitness_app/core/dummy/dummy_data.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscle_group_id_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusclesGroupByIdListViewwBlocBuilder extends StatelessWidget {
  const MusclesGroupByIdListViewwBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreViewModel, ExploreState>(
      buildWhen: (p, c) =>
          p.isMusclesbyGroupsIdLoading != c.isMusclesbyGroupsIdLoading ||
          p.musclesGroupsbyGroupIdFailure != c.musclesGroupsbyGroupIdFailure ||
          p.muscleGroupDetailsResponseEntity !=
              c.muscleGroupDetailsResponseEntity,
      builder: (context, state) {
        if (state.isMusclesbyGroupsIdLoading) {
          return MusclesGroupByIdListVieww(
            isLoading: state.isMusclesbyGroupsIdLoading,
            musclesList: musclesDummyList,
          );
        }

        if (state.muscleGroupDetailsResponseEntity!.muscles.isEmpty) {
          return const Center(child: Text('No Data'));
        }

        if (state.musclesGroupsbyGroupIdFailure != null) {
          return Center(
            child: Text(state.musclesGroupsbyGroupIdFailure!.errorMessage),
          );
        }

        return MusclesGroupByIdListVieww(
          isLoading: state.isMusclesbyGroupsIdLoading,
          musclesList: state.muscleGroupDetailsResponseEntity!.muscles,
        );
      },
    );
  }
}

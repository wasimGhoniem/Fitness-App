import 'package:fitness_app/core/dummy/dummy_data.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscles_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusclesListViewBlocBuilder extends StatelessWidget {
  const MusclesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreViewModel, ExploreState>(
      buildWhen: (p, c) =>
          p.isToMuscleLoading != c.isToMuscleLoading ||
          p.muscleResponseEntity != c.muscleResponseEntity ||
          p.musclesFailure != c.musclesFailure,
      builder: (context, state) {
        if (state.isToMuscleLoading) {
          return MusclesListVieww(
            isLoading: true,
            musclesList: musclesDummyList,
          );
        }

        if (state.musclesFailure != null) {
          return Text(state.musclesFailure!.errorMessage);
        }
        return MusclesListVieww(
          isLoading: false,
          musclesList: state.muscleResponseEntity!.muscles,
        );
      },
    );
  }
}

import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscle_groupe_tab_bar_widget.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/tabs_shimmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TapsBlocBuilder extends StatelessWidget {
  const TapsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreViewModel, ExploreState>(
      buildWhen: (p, c) =>
          p.isMusclesGroupsLoading != c.isMusclesGroupsLoading ||
          p.musclesGroupsFailure != c.musclesGroupsFailure ||
          p.musclesGroupsResponseEntity != c.musclesGroupsResponseEntity,
      builder: (context, state) {
        if (state.isMusclesGroupsLoading) {
          return const TabsShimmerEffectWidget();
        }
        if (state.musclesGroupsFailure != null) {
          return Center(child: Text(state.musclesGroupsFailure!.errorMessage));
        }
        return WorkOutsTaps(
          musclesGroup: state.musclesGroupsResponseEntity!.musclesGroup,
        );
      },
    );
  }
}

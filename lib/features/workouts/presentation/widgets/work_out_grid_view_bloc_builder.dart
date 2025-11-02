import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/food/presentation/widgets/app_shimmers.dart';
import 'package:fitness_app/features/workouts/presentation/viewModel/work_out_events.dart';
import 'package:fitness_app/features/workouts/presentation/viewModel/work_out_state.dart';
import 'package:fitness_app/features/workouts/presentation/viewModel/work_out_view_model.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/work_out_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutGridViewBlocBuilder extends StatelessWidget {
  const WorkOutGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkOutViewModel, WorkOutState>(
      builder: (context, state) {
        if (state.isMusclesbyGroupsIdLoading) {
          return AppShimmers.mealsGridShimmer;
        }

        if (state.musclesGroupsbyGroupIdFailure != null &&
            state.muscleGroupDetailsResponseEntity == null) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.musclesGroupsbyGroupIdFailure!.errorMessage),
                const SizedBox(height: AppSizes.padding_16),
                TextButton(
                  onPressed: () {
                    context.read<WorkOutViewModel>().doIntent(
                      events: GetAllWorkOuts(id: AppConstants.abdominalsId),
                    );
                  },
                  child: Text(LocaleKeys.retry.tr()),
                ),
              ],
            ),
          );
        }

        if (state.muscleGroupDetailsResponseEntity?.muscles.isEmpty ?? true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fitness_center_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 100,
                ),
                const SizedBox(height: AppSizes.padding_16),
                Text(LocaleKeys.no_workouts.tr()),
              ],
            ),
          );
        }

        return WorkOutGridView(
          muscles: state.muscleGroupDetailsResponseEntity!.muscles,
        );
      },
    );
  }
}

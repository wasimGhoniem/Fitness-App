import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/app_shimmers.dart';
import 'package:fitness_app/features/food/presentation/widgets/build_tab_bar.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/viewModel/work_out_events.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/viewModel/work_out_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/viewModel/work_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutsTabsBlocBuilder extends StatelessWidget {
  const WorkOutsTabsBlocBuilder({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkOutViewModel, WorkOutState>(
      builder: (context, state) {
        if (state.isMusclesGroupsLoading) {
          return AppShimmers.tabsShimmer;
        } else if (state.musclesGroupsFailure != null) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.musclesGroupsFailure?.errorMessage ?? ''),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
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
        if (state.musclesGroupsResponseEntity == null ||
            state.musclesGroupsResponseEntity!.musclesGroup.isEmpty) {
          return const SizedBox.shrink();
        }
        final muscles = state.musclesGroupsResponseEntity!.musclesGroup;
        return BuildTabBar(
          initialIndex: initialIndex,
          tabsLength: muscles.length,
          taps: muscles.map((category) => Tab(text: category.name)).toList(),
          onTap: (index) {
            context.read<WorkOutViewModel>().doIntent(
              events: GetWorkOutByeId(id: muscles[index].id),
            );
          },
        );
      },
    );
  }
}

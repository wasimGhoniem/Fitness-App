import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/workouts/presentation/viewModel/work_out_events.dart';
import 'package:fitness_app/features/workouts/presentation/viewModel/work_out_view_model.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/work_out_grid_view_bloc_builder.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/work_out_tabs_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutScreenBody extends StatefulWidget {
  const WorkOutScreenBody({super.key});

  @override
  State<WorkOutScreenBody> createState() => _WorkOutScreenBodyState();
}

class _WorkOutScreenBodyState extends State<WorkOutScreenBody> {
  late final WorkOutViewModel _viewModel;

  @override
  void initState() {
    _viewModel = getIt<WorkOutViewModel>();
    _viewModel.doIntent(events: GetAllWorkOuts(id: AppConstants.abdominalsId));
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: Scaffold(
        body: GlassLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          backGroundImage: Assets.assetsImagesHomeBg,
          body: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding_16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSizes.spaceBetweenItems_40),
                  Text(
                    LocaleKeys.workouts.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems_24),
                  const WorkOutsTabsBlocBuilder(initialIndex: 0),
                  const SizedBox(height: AppSizes.spaceBetweenItems_24),
                  const SizedBox(
                    height: 500,
                    child: WorkOutGridViewBlocBuilder(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

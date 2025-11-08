import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_event.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_footer.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseScreenBody extends StatefulWidget {
  const ExerciseScreenBody({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;

  @override
  State<ExerciseScreenBody> createState() => _ExerciseScreenBodyState();
}

class _ExerciseScreenBodyState extends State<ExerciseScreenBody> {
  late ExerciseViewModel _exerciseViewModel;

  @override
  void initState() {
    _exerciseViewModel = getIt<ExerciseViewModel>();
    _exerciseViewModel.doIntent(
      GetDifficultyLevelsEvent(muscleId: widget.exerciseModel.id),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _exerciseViewModel,
      child: GlassLayout(
        backGroundImage: Assets.assetsImagesHomeBgBigWidth,
        body: [
          ExerciseHeader(
            exerciseModel: widget.exerciseModel,
            exerciseViewModel: _exerciseViewModel,
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_8),
          const ExerciseFooter(),
          const SizedBox(height: AppSizes.spaceBetweenItems_40),
        ],
      ),
    );
  }
}

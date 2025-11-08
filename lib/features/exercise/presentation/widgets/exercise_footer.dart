import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_listview_bloc_builder.dart';
import 'package:flutter/material.dart';

class ExerciseFooter extends StatelessWidget {
  const ExerciseFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
      child: GlassContainer(
        width: double.infinity,
        contentPadding: EdgeInsetsGeometry.zero,
        body: [ExerciseListViewBlocBuilder()],
      ),
    );
  }
}

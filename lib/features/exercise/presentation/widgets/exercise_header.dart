import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/taps_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseHeader extends StatelessWidget {
  const ExerciseHeader({
    super.key,
    required this.exerciseModel,
    required this.exerciseViewModel,
  });

  final ExerciseModel exerciseModel;
  final ExerciseViewModel exerciseViewModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(AppSizes.borderRadius_32),
        bottomLeft: Radius.circular(AppSizes.borderRadius_32),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: exerciseModel.image,
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColorsLight.glassContainerColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: AppSizes.padding_36,
            left: AppSizes.padding_16,
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(Assets.assetsIconsBackSvg),
            ),
          ),
          Positioned.fill(
            bottom: AppSizes.padding_16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    exerciseModel.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
                TabBarBlocBuilder(
                  exerciseModel: exerciseModel,
                  exerciseViewModel: exerciseViewModel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

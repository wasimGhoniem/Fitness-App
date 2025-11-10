import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_bording_events.dart';
import 'package:fitness_app/features/on_boarding/presentation/widgets/on_boarding_buttons.dart';
import 'package:fitness_app/features/on_boarding/presentation/widgets/on_boarding_dot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onBoardingModel,
    required this.pageController,
    required this.currentIndex,
    required this.totalPages,
  });
  final OnBoardingEntity onBoardingModel;
  final PageController pageController;
  final int currentIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final trueTotalPages = totalPages - 1;
    return GlassLayout(
      backGroundImage: Assets.assetsImagesOnboardignBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: AppSizes.spaceBetweenItems_24),
          if (currentIndex != trueTotalPages)
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  context.read<OnBoardingViewModel>().doIntent(
                    GoToSignRouteEvent(
                      context: context,
                      key: AppConstants.isEnboardingSeen,
                      value: 'true',
                    ),
                  );
                },
                child: Text(
                  LocaleKeys.skip.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          Flexible(child: Center(child: Image.asset(onBoardingModel.image))),
          GlassContainer(
            width: double.infinity,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding_16,
              vertical: AppSizes.padding_32,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.borderRadius_50),
              topRight: Radius.circular(AppSizes.borderRadius_50),
            ),
            body: [
              Text(
                onBoardingModel.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_10),
              Text(
                onBoardingModel.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_10),
              OnBoardingDotWidget(
                currentIndex: currentIndex,
                totalPages: totalPages,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_24),
              OnBoardingButtons(
                currentIndex: currentIndex,
                trueTotalPages: trueTotalPages,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

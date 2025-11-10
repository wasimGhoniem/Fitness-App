import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_bording_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({
    super.key,
    required this.currentIndex,
    required this.trueTotalPages,
  });

  final int currentIndex;
  final int trueTotalPages;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnBoardingViewModel>();
    if (currentIndex == 0) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            viewModel.doIntent(GoToNextPageEvent());
          },
          child: Text(
            LocaleKeys.next.tr(),
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            backgroundColor: Colors.transparent.withAlpha(0),
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            viewModel.doIntent(GoToPreviousPageEvent());
          },
          child: Text(
            LocaleKeys.back.tr(),
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          onPressed: currentIndex == trueTotalPages
              ? () => context.read<OnBoardingViewModel>().doIntent(
                  GoToSignRouteEvent(
                    context: context,
                    key: AppConstants.isEnboardingSeen,
                    value: 'true',
                  ),
                )
              : () => viewModel.doIntent(GoToNextPageEvent()),
          child: currentIndex == trueTotalPages
              ? Text(
                  LocaleKeys.do_it.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
                )
              : Text(
                  LocaleKeys.next.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
                ),
        ),
      ],
    );
  }
}

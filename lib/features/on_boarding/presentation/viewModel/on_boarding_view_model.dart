import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:fitness_app/features/on_boarding/domain/useCases/cash_onbarding_use_case.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_boarding_state.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_bording_events.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnBoardingViewModel extends Cubit<OnBoardingState> {
  OnBoardingViewModel(this._cacheOnBoardingUseCase)
    : super(const OnBoardingState());
  final CacheOnBoardingUseCase _cacheOnBoardingUseCase;
  final PageController pageController = PageController();
  final List<OnBoardingEntity> onBoardingList = const [
    OnBoardingEntity(
      image: Assets.assetsImagesOnboardingFirst,
      title: 'the price of excellence  is discipline',
      description:
          'Success doesn’t come overnight — it’s built through consistency, focus, and the discipline to keep going every day.',
    ),
    OnBoardingEntity(
      image: Assets.assetsImagesOnboardingSecond,
      title: 'Fitness has never been so  much fun',
      description:
          'Turn your workouts into moments of joy. Train smart, stay active, and enjoy every step of your fitness journey.',
    ),
    OnBoardingEntity(
      image: Assets.assetsImagesOnboardingThird,
      title: 'NO MORE EXCUSES Do It Now',
      description:
          'Stop waiting for the perfect time — start today. Every small action brings you closer to your goals.',
    ),
  ];

  void doIntent(OnBordingEvents event) {
    switch (event) {
      case GoToNextPageEvent():
        _goToNextPage();
        break;
      case GoToPreviousPageEvent():
        _goToPreviousPage();
        break;
      case GoToSignRouteEvent(
        context: final context,
        key: final key,
        value: final value,
      ):
        _goToSignRoute(context, key: key, value: value);
        break;
    }
  }

  void _goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToSignRoute(
    BuildContext context, {
    required String key,
    required String value,
  }) async {
    await _cacheOnBoardingUseCase.call(key: key, value: value);
    context.pushReplacementNamed(AppRoutes.signInRoute);
  }
}

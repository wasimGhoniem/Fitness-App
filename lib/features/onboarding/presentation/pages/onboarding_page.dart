import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/features/onboarding/presentation/onboarding_model.dart';
import 'package:fitness_app/features/onboarding/presentation/widgets/dot_indecator.dart';
import 'package:fitness_app/features/onboarding/presentation/widgets/onboarding_details_container.dart';
import 'package:fitness_app/features/onboarding/presentation/widgets/onboarding_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  List<OnboardingModel> onBoardingList = [
    OnboardingModel(
      imagePath: Assets.assetsImagesOnboardingFirst,
      title: LocaleKeys.title1.tr(),
      description: LocaleKeys.description1.tr(),
    ),
    OnboardingModel(
      imagePath: Assets.assetsImagesOnboardingSecond,
      title: LocaleKeys.title2.tr(),
      description: LocaleKeys.description1.tr(),
    ),
    OnboardingModel(
      imagePath: Assets.assetsImagesOnboardingThird,
      title: LocaleKeys.title3.tr(),
      description: LocaleKeys.description1.tr(),
    ),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.glassContainerColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesOnboardignBg),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: AppColorsLight.white.withValues(alpha: 0.1),
            child: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: onBoardingList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: AppSizes.spaceBetweenItems_50),
                          Image.asset(onBoardingList[index].imagePath),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoutes.mainLayoutRoute);
                        saveOnBoarding();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.padding_16),
                        child: Text(
                          LocaleKeys.skip.tr(),
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  OnboardingDetailsContainer(
                    body: [
                      Text(
                        onBoardingList[currentIndex].title,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      Text(
                        onBoardingList[currentIndex].description,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DotIndicator(active: currentIndex == 0),
                          DotIndicator(active: currentIndex == 1),
                          DotIndicator(active: currentIndex == 2),
                        ],
                      ),
                      currentIndex == 0
                          ? CustomElevatedButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  currentIndex + 1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.bounceInOut,
                                );
                              },
                              isLoading: false,
                              widget: Text(
                                LocaleKeys.next.tr(),
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OnboardingElevatedButton(
                                  onPressed: () {
                                    _pageController.animateToPage(
                                      currentIndex - 1,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.bounceInOut,
                                    );
                                  },
                                  backgroundColor: Colors.transparent,
                                  widget: Text(
                                    LocaleKeys.back.tr(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                ),
                                OnboardingElevatedButton(
                                  onPressed: currentIndex == 2
                                      ? () {
                                          context.pushNamed(
                                            AppRoutes.mainLayoutRoute,
                                          );
                                          saveOnBoarding();
                                        }
                                      : () {
                                          _pageController.animateToPage(
                                            currentIndex + 1,
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            curve: Curves.bounceInOut,
                                          );
                                        },
                                  widget: Text(
                                    currentIndex == 1
                                        ? LocaleKeys.next.tr()
                                        : LocaleKeys.do_it.tr(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                    ],
                    height: AppSizes.glassContainerHeight_230,
                    bottomLeft: 0,
                    bottomRight: 0,
                    contentPadding: const EdgeInsets.all(AppSizes.padding_24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.onBoarding, true);
  }
}

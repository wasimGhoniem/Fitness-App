import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/enum/activity_lvl_enum.dart';
import 'package:fitness_app/core/enum/gender_enum.dart';
import 'package:fitness_app/core/enum/goal_enum.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/ginder_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/goal_and_physical_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/metric_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/sign_up_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  final List<GoalEnum> goals = const [
    GoalEnum.loseWeight,
    GoalEnum.gainWeight,
    GoalEnum.getFitter,
    GoalEnum.gainMoreFlexible,
    GoalEnum.learnTheBasic,
  ];
  final List<ActivityLevel> activityLevel = const [
    ActivityLevel.rookie,
    ActivityLevel.beginner,
    ActivityLevel.intermediate,
    ActivityLevel.advance,
    ActivityLevel.trueBeast,
  ];

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  late final ValueNotifier<GenderEnum?> _selectedGenderNotifier;
  late final ValueNotifier<int> _ageNotifier;
  late final ValueNotifier<int> _heightNotifier;
  late final ValueNotifier<int> _weightNotifier;
  late final ValueNotifier<GoalEnum?> _goalNotifier;
  late final ValueNotifier<ActivityLevel?> _PhysicalNotifier;
  late final ValueNotifier<int> _pageNotifer;
  late final PageController _pageController;
  @override
  void initState() {
    _selectedGenderNotifier = ValueNotifier(null);
    _ageNotifier = ValueNotifier(0);
    _heightNotifier = ValueNotifier(0);
    _weightNotifier = ValueNotifier(0);
    _pageController = PageController();
    _goalNotifier = ValueNotifier(null);
    _PhysicalNotifier = ValueNotifier(null);
    _pageNotifer = ValueNotifier(1);

    super.initState();
  }

  @override
  void dispose() {
    _selectedGenderNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (value) => _pageNotifer.value = value + 1,
      children: [
        GinderWidget(
          selectedGenderNotifier: _selectedGenderNotifier,
          pageController: _pageController,
          pageNotifier: _pageNotifer,
        ),
        UserMetricWidget(
          text: LocaleKeys.label_years.tr(),
          valueNotifier: _ageNotifier,
          pageController: _pageController,
          question: LocaleKeys.howOldAreYou.tr(),
          pageNotifer: _pageNotifer,
        ),
        UserMetricWidget(
          text: LocaleKeys.label_kg.tr(),
          valueNotifier: _weightNotifier,
          pageController: _pageController,
          question: LocaleKeys.whatIsYourWeight.tr(),
          pageNotifer: _pageNotifer,
        ),
        UserMetricWidget(
          text: LocaleKeys.label_cm.tr(),
          valueNotifier: _heightNotifier,
          pageController: _pageController,
          question: LocaleKeys.whatIsYourHeight.tr(),
          pageNotifer: _pageNotifer,
        ),
        GoalAndPhysicalWidget<GoalEnum>(
          choices: widget.goals,
          valueNotifier: _goalNotifier,
          pageController: _pageController,
          question: LocaleKeys.whatIsYourGoal.tr(),
          pageNotifier: _pageNotifer,
          getDisplayName: (value) => value.displayName,
        ),
        GoalAndPhysicalWidget<ActivityLevel>(
          choices: widget.activityLevel,
          valueNotifier: _PhysicalNotifier,
          pageController: _pageController,
          question: LocaleKeys.yourRegularPhysicalActivityLevel.tr(),
          pageNotifier: _pageNotifer,
          getDisplayName: (value) => value.displayName,
        ),
        ValueListenableBuilder<int>(
          valueListenable: _pageNotifer,
          builder: (context, currentPage, _) {
            if (currentPage < 6) return const SizedBox();
            return SignUpWidget(
              age: _ageNotifier.value,
              gender: _selectedGenderNotifier.value!.name,
              goal: _goalNotifier.value!.name,
              height: _heightNotifier.value,
              physicalLevel: _PhysicalNotifier.value!.apiValue,
              weight: _weightNotifier.value,
            );
          },
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/enum/goal_enum.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/goal_scale_widget.dart';
import 'package:flutter/material.dart';

class GoalEditScreen extends StatefulWidget {
  const GoalEditScreen({super.key, this.initialGoal});

  final GoalEnum? initialGoal;

  @override
  State<GoalEditScreen> createState() => _GoalEditScreenState();
}

class _GoalEditScreenState extends State<GoalEditScreen> {
  late ValueNotifier<GoalEnum?> _goalNotifier;

  final List<GoalEnum> goals = const [
    GoalEnum.loseWeight,
    GoalEnum.gainWeight,
    GoalEnum.getFitter,
    GoalEnum.gainMoreFlexible,
    GoalEnum.learnTheBasic,
  ];

  @override
  void initState() {
    _goalNotifier = ValueNotifier(widget.initialGoal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoalScaleWidget<GoalEnum>(
      choices: goals,
      valueNotifier: _goalNotifier,
      question: LocaleKeys.whatIsYourGoal.tr(),
      getDisplayName: (value) => value.displayName,
      onPressed: () => Navigator.pop(context, _goalNotifier.value),
    );
  }
}

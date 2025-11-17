import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/enum/activity_lvl_enum.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/goal_scale_widget.dart';
import 'package:flutter/material.dart';

class ActivityEditScreen extends StatefulWidget {
  const ActivityEditScreen({super.key,  this.initialActivityLevel});
  final ActivityLevel? initialActivityLevel ;

  @override
  State<ActivityEditScreen> createState() => _ActivityEditScreenState();
}

class _ActivityEditScreenState extends State<ActivityEditScreen> {
  // List of available choices
  final List<ActivityLevel> activityLevels = const [
    ActivityLevel.rookie,
    ActivityLevel.beginner,
    ActivityLevel.intermediate,
    ActivityLevel.advance,
    ActivityLevel.trueBeast,
  ];

  late ValueNotifier<ActivityLevel?> _activityNotifier;

  @override
  void initState() {
    super.initState();
    _activityNotifier = ValueNotifier(widget.initialActivityLevel);
  }

  @override
  Widget build(BuildContext context) {
    return GoalScaleWidget<ActivityLevel>(
      choices: activityLevels,
      valueNotifier: _activityNotifier,
      question: LocaleKeys.yourRegularPhysicalActivityLevel.tr(),
      getDisplayName: (value) => value.displayName,
      onPressed: () => Navigator.pop(context, _activityNotifier.value),
    );
  }
}

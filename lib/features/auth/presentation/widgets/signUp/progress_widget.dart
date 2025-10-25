import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.valueNotifier,
    required this.TotalSteps,
  });
  final ValueNotifier<int> valueNotifier;
  final int TotalSteps;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, currentStep, child) {
        return CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 3.0,
          percent: currentStep / TotalSteps,
          center: Text(
            '$currentStep/$TotalSteps',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          progressColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/weight_scale_widget.dart';
import 'package:flutter/material.dart';

class WeightEditScreen extends StatefulWidget {
  const WeightEditScreen({super.key,  this.initialWeight});

  final int? initialWeight;

  @override
  State<WeightEditScreen> createState() => _WeightEditScreenState();
}

class _WeightEditScreenState extends State<WeightEditScreen> {
  late ValueNotifier<int> _weightNotifier;

  @override
  void initState() {
    _weightNotifier = ValueNotifier(widget.initialWeight!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WeightScaleWidget(
      valueNotifier: _weightNotifier,
      question: LocaleKeys.whatIsYourWeight.tr(),
      text: LocaleKeys.label_kg.tr(),
      maxValue: 600,
      minValue: 40,
      onPressed: () => Navigator.pop(context, _weightNotifier.value),
    );
  }
}

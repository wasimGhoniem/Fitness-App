import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

class IngredientsTitle extends StatelessWidget {
  const IngredientsTitle({super.key, required this.textStyle});

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.ingredients.tr(),
      style: textStyle!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

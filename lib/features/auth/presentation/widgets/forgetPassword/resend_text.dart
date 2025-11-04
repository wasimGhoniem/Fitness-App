import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ResendText extends StatelessWidget {
  const ResendText({super.key});


  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.resend_code.tr(),
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        decoration: TextDecoration.underline,
        color: Theme.of(context).colorScheme.primary,
        decorationColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
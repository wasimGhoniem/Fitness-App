import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRedirectTextSpan extends StatelessWidget {
  const AuthRedirectTextSpan({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });
  final String question;
  final String action;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: question,
        style: Theme.of(context).textTheme.labelLarge!,
        children: [
          TextSpan(
            text: action,
            style: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline,
              decorationColor: theme.colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

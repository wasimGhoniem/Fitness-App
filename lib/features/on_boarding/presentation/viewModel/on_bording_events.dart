import 'package:flutter/material.dart';

sealed class OnBordingEvents {}

class GoToNextPageEvent extends OnBordingEvents {}

class GoToPreviousPageEvent extends OnBordingEvents {}

class GoToSignRouteEvent extends OnBordingEvents {
  GoToSignRouteEvent({
    required this.context,
    required this.key,
    required this.value,
  });
  final BuildContext context;
  final String key;
  final String value;
}

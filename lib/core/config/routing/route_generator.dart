import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'No Route Found',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Center(
          child: Text('No Route Found', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

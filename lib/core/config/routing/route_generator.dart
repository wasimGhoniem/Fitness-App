import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/models/selected_food_category_model.dart';
import 'package:fitness_app/features/food/presentation/pages/food_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.foodRoute:
        // final args = settings.arguments as SelectedFoodCategoryModel;
        final SelectedFoodCategoryModel model = SelectedFoodCategoryModel(
          mealCategoryName: 'Seafood',
          selectedIndex: 0,
        );
        return MaterialPageRoute(
          builder: (_) => FoodScreen(selectedFoodCategoryModel: model),
        );
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

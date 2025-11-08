import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/core/models/selected_food_category_model.dart';
import 'package:fitness_app/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:fitness_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:fitness_app/features/exercise/presentation/pages/exercise_screen.dart';
import 'package:fitness_app/features/food/presentation/pages/food_screen.dart';
import 'package:fitness_app/features/food_details/presentation/pages/food_details_screen.dart';
import 'package:fitness_app/features/mainLayout/main_layout.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case AppRoutes.foodRoute:
        // final args = settings.arguments as SelectedFoodCategoryModel;
        final SelectedFoodCategoryModel model = SelectedFoodCategoryModel(
          mealCategoryName: 'Seafood',
          selectedIndex: 0,
        );
        return MaterialPageRoute(
          builder: (_) => FoodScreen(selectedFoodCategoryModel: model),
        );

      case AppRoutes.exerciseRoute:
        final args = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseScreen(exerciseModel: args),
        );
      case AppRoutes.foodDetailsRoute:
        final String mealId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => FoodDetailsScreen(mealId: mealId),
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

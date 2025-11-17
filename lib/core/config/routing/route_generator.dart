import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/enum/content_display_type.dart';
import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:fitness_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:fitness_app/features/changePassowrd/presentation/pages/change_password_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/activity_edit_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/edit_profile_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/goal_edit_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/weight_edit_screen.dart';
import 'package:fitness_app/features/exercise/presentation/pages/exercise_screen.dart';
import 'package:fitness_app/features/food/presentation/pages/food_screen.dart';
import 'package:fitness_app/features/foodDetails/presentation/pages/food_details_screen.dart';
import 'package:fitness_app/features/mainLayout/main_layout.dart';
import 'package:fitness_app/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:fitness_app/core/models/selected_food_category_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/pages/work_outs_screen.dart';
import 'package:fitness_app/features/profileMain/presentation/pages/content_display_screen.dart';
import 'package:fitness_app/features/profileMain/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.mainLayoutRoute:
        final int? index = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => MainLayout(initialIndex: index ?? 0),
        );
      case AppRoutes.foodRoute:
        final args = settings.arguments as SelectedFoodCategoryModel;
        return MaterialPageRoute(
          builder: (_) => FoodScreen(selectedFoodCategoryModel: args),
        );

      case AppRoutes.exerciseRoute:
        final args = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseScreen(exerciseModel: args),
        );
      case AppRoutes.workoutRoute:
        return MaterialPageRoute(builder: (_) => const WorkOutsScreen());
      case AppRoutes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.foodDetailsRoute:
        final String mealId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => FoodDetailsScreen(mealId: mealId),
        );
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case AppRoutes.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case AppRoutes.contentDisplayRoute:
        final ContentDisplayType contentDisplayType =
            settings.arguments as ContentDisplayType;
        return MaterialPageRoute(
          builder: (_) => ContentDisplayScreen(type: contentDisplayType),
        );
      case AppRoutes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      //edit weight route
      case AppRoutes.editWeightRoute:
        return MaterialPageRoute(builder: (_) => const WeightEditScreen());

      case AppRoutes.editGoalRoute:
        return MaterialPageRoute(builder: (_) => const GoalEditScreen());

      case AppRoutes.editActivityLevelRoute:
        return MaterialPageRoute(builder: (_) => const ActivityEditScreen());

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

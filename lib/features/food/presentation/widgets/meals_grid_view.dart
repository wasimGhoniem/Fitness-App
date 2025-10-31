import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/food/domain/entity/meals_entity.dart';
import 'package:fitness_app/features/food/presentation/widgets/meal_grid_item.dart';

class MealsGridView extends StatelessWidget {
  const MealsGridView({super.key, required this.meals});

  final List<MealsEntity> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.spaceBetweenItems_16,
        mainAxisSpacing: AppSizes.spaceBetweenItems_16,
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealGridItem(
          mealName: meal.mealName ?? '',
          mealPhoto: meal.mealPhoto ?? '',
        );
      },
    );
  }
}

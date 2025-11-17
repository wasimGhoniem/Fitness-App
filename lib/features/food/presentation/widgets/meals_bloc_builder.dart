import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/app_shimmers.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_event.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_state.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_view_model.dart';
import 'package:fitness_app/features/food/presentation/widgets/meals_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsBlocBuilder extends StatelessWidget {
  const MealsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodViewModel, FoodState>(
      builder: (context, state) {
        if (state.isMealsLoading) {
          return AppShimmers.mealsGridShimmer;
        }

        if (state.mealsFailure != null && state.mealsResponse == null) {
          final mealCategoryName =
              state.categoriesResponse?.categories?.isNotEmpty == true
              ? state.categoriesResponse!.categories!.first.categoryName ?? ''
              : '';

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.mealsFailure?.errorMessage ?? ''),
                const SizedBox(height: AppSizes.padding_16),
                TextButton(
                  onPressed: () {
                    context.read<FoodViewModel>().doIntent(
                      GetMealsByCategoryEvent(
                        mealCategoryName: mealCategoryName,
                      ),
                    );
                  },
                  child: Text(LocaleKeys.retry.tr()),
                ),
              ],
            ),
          );
        }

        if (state.mealsResponse?.meals?.isEmpty ?? true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 100,
                ),
                const SizedBox(height: AppSizes.padding_16),
                Text(LocaleKeys.no_meals.tr()),
              ],
            ),
          );
        }

        final meals = state.mealsResponse!.meals!;

        return MealsGridView(meals: meals);
      },
    );
  }
}

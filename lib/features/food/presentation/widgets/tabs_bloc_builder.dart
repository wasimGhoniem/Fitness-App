import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/app_shimmers.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_event.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_state.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_view_model.dart';
import 'package:fitness_app/features/food/presentation/widgets/build_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsBlocBuilder extends StatelessWidget {
  const TabsBlocBuilder({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodViewModel, FoodState>(
      builder: (context, state) {
        if (state.isCategoriesLoading) {
          return AppShimmers.tabsShimmer;
        } else if (state.categoriesFailure != null) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.categoriesFailure?.errorMessage ?? ''),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
                TextButton(
                  onPressed: () {
                    context.read<FoodViewModel>().doIntent(
                      LoadAllFoodDataEvent(mealCategoryName: 'Seafood'),
                    );
                  },
                  child: Text(LocaleKeys.retry.tr()),
                ),
              ],
            ),
          );
        }
        if (state.categoriesResponse == null ||
            state.categoriesResponse!.categories!.isEmpty) {
          return const SizedBox.shrink();
        }
        final category = state.categoriesResponse!.categories!;
        return BuildTabBar(
          initialIndex: initialIndex,
          tabsLength: category.length,
          taps: category
              .map((category) => Tab(text: category.categoryName))
              .toList(),
          onTap: (index) {
            context.read<FoodViewModel>().doIntent(
              GetMealsByCategoryEvent(
                mealCategoryName: category[index].categoryName!,
              ),
            );
          },
        );
      },
    );
  }
}

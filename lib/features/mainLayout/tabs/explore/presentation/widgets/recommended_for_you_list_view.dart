import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/food/domain/entity/meal_category_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/recommended_list_view_item.dart';
import 'package:flutter/material.dart';

class ReccomendedForYouListView extends StatelessWidget {
  const ReccomendedForYouListView({
    super.key,
    required this.isLoading,
    required this.musclesList,
  });
  final bool isLoading;
  final List<MealCategoryEntity> musclesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
        itemCount: musclesList.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSizes.spaceBetweenItems_16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecommendedListViewItem(
          categories: musclesList[index],
          isLoading: isLoading,
        ),
      ),
    );
  }
}

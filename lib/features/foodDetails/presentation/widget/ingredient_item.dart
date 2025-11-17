import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
    required this.measure,
  });

  final String ingredient;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding_8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              ingredient,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColorsLight.white,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: AppSizes.padding_8),
          Text(
            measure,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
    required this.ingredients,
    required this.measures,
  });

  final List<String>? ingredients;
  final List<String>? measures;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSizes.borderRadius_20),
      ),
      child: GlassContainer(
        body: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(ingredients!.length, (index) {
              final Widget item = IngredientItem(
                ingredient: ingredients![index],
                measure: measures![index],
              );

              if (index == 0) {
                return item;
              } else {
                return Column(
                  children: [
                    Divider(color: AppColorsLight.black[20]),
                    item,
                  ],
                );
              }
            }),
          ),
        ],

        width: double.infinity,
      ),
    );
  }
}

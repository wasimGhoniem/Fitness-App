import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/features/food/domain/entity/meal_category_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedListViewItem extends StatelessWidget {
  const RecommendedListViewItem({
    super.key,
    required this.isLoading,
    required this.categories,
  });
  final bool isLoading;
  final MealCategoryEntity categories;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        highlightColor: AppColorsLight.black[30]!,
        baseColor: AppColorsLight.black[60]!,
      ),
      child: Stack(
        children: [
          isLoading
              ? Bone(
                  height: 104,
                  width: 104,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
                  child: CachedNetworkImage(
                    imageUrl: categories.categoryPhoto!,
                    height: 104,
                    width: 104,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      height: 24,
                      width: 24,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error, color: Colors.white),
                    ),
                  ),
                ),
          Positioned.fill(
            top: 73,
            child: Skeleton.ignore(
              child: GlassContainer(
                width: double.infinity,
                radius: AppSizes.borderRadius_20,
                contentPadding: const EdgeInsetsGeometry.all(0),
                opacity: 0.5,
                body: [
                  Text(
                    categories.categoryName!,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

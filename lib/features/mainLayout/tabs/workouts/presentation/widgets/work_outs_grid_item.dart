import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WorkOutsGridItem extends StatelessWidget {
  const WorkOutsGridItem({
    super.key,
    required this.mealPhoto,
    required this.mealName,
  });

  final String mealPhoto;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
          child: CachedNetworkImage(
            imageUrl: mealPhoto,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.withValues(alpha: 0.1),
              child: const Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding_16,
            ),
            child: Text(
              mealName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColorsLight.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

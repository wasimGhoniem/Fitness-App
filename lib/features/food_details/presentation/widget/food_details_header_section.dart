import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/youtube_player_service.dart';
import 'package:fitness_app/features/food_details/presentation/widget/nutrition_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDetailsHeaderSection extends StatelessWidget {
  const FoodDetailsHeaderSection({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onBack,
    required this.videoUrl,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onBack;
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(AppSizes.borderRadius_32),
        bottomLeft: Radius.circular(AppSizes.borderRadius_32),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: imageUrl,
              fit: BoxFit.cover,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.padding_16,
              right: AppSizes.padding_16,
              bottom: AppSizes.padding_16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.padding_24),
                InkWell(
                  onTap: onBack,
                  child: SvgPicture.asset(Assets.assetsIconsBackSvg),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_32),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      color: Theme.of(context).colorScheme.primary,
                      size: AppSizes.icon_64,
                    ),
                    onPressed: () =>YoutubePlayerService.playVideo(context, videoUrl),

                  ),
                ),

                const SizedBox(height: AppSizes.spaceBetweenItems_32),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSizes.padding_4),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSizes.padding_20),
                const _NutritionBadgesRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NutritionBadgesRow extends StatelessWidget {
  const _NutritionBadgesRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: NutritionBadge(value: '100 kcal', label: 'Energy'),
        ),
        const SizedBox(width: AppSizes.padding_8),
        Expanded(
          child: NutritionBadge(
            value: '15 ${LocaleKeys.unit_g.tr()}',
            label: LocaleKeys.protein.tr(),
          ),
        ),
        const SizedBox(width: AppSizes.padding_8),
        Expanded(
          child: NutritionBadge(
            value: '58 ${LocaleKeys.unit_g.tr()}',
            label: LocaleKeys.carbs.tr(),
          ),
        ),
        const SizedBox(width: AppSizes.padding_8),
        Expanded(
          child: NutritionBadge(
            value: '20 ${LocaleKeys.unit_g.tr()}',
            label: LocaleKeys.fat.tr(),
          ),
        ),
      ],
    );
  }
}


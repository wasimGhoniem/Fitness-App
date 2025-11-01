import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.isLoading,
    required this.profileEntity,
  });
  final ProfileEntity profileEntity;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        highlightColor: AppColorsLight.black[30]!,
        baseColor: AppColorsLight.black[60]!,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${LocaleKeys.hi_user.tr()} ${profileEntity.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.lets_start_your_day.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                isLoading
                    ? Bone(
                        height: 24,
                        width: 24,
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusFull,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: profileEntity.avatar,
                        imageBuilder: (context, imageProvider) =>
                            CircleAvatar(backgroundImage: imageProvider),

                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

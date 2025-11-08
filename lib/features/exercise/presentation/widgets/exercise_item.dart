import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/functions/show_youtube_video_dialog.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercise_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.exercises,
    required this.thumbnail,
    required this.isLoading,
    required this.videoId,
  });
  final ExerciseEntity exercises;
  final String thumbnail;
  final String videoId;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        highlightColor: AppColorsLight.black[30]!,
        baseColor: AppColorsLight.black[60]!,
      ),
      enabled: isLoading,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppSizes.spaceBetweenItems_16,
        children: [
          isLoading
              ? Bone(
                  width: 80,
                  height: 80,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
                )
              : Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadius_20,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: thumbnail,
                      width: 80,
                      height: 90,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(exercises.name),
                Text(
                  exercises.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          isLoading
              ? Bone(
                  width: 24,
                  height: 24,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
                )
              : GestureDetector(
                  onTap: () {
                    showYoutubeVideoDilaog(context, videoId);
                  },
                  child: Image.asset(Assets.assetsImagesPlaybtn),
                ),
        ],
      ),
    );
  }
}

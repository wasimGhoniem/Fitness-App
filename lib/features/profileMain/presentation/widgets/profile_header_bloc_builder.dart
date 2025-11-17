import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/app_shimmers.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_state.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderBlocBuilder extends StatelessWidget {
  const ProfileHeaderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileMainViewModel, ProfileMainState>(
      builder: (context, state) {
        if (state.isLoading) {
          return AppShimmers.profileHeaderShimmer;
        } else if (state.failure != null) {
          return Center(child: Text(state.failure!.errorMessage));
        }

        if (state.loggedUserDataResponseEntity == null ||
            state.loggedUserDataResponseEntity?.user == null) {
          return const Center(child: Text('No user data available'));
        }

        final user = state.loggedUserDataResponseEntity!.user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: AppSizes.borderRadius_50,
                backgroundColor: Colors.grey.shade200,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user!.photo!,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    placeholder: (context, url) => const Icon(
                      Icons.person,
                      size: AppSizes.icon_36,
                      color: AppColorsLight.gray,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: AppSizes.icon_36,
                      color: AppColorsLight.red,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding_4),
            Text(
              user.firstName!,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        );
      },
    );
  }
}

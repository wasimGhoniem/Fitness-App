import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/app_shimmers.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_bloc.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_state.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileHeaderBlocBuilder extends StatelessWidget {
  const EditProfileHeaderBlocBuilder({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File imageFile = File(image.path);

      context.read<EditProfileViewModel>().doIntend(
        OnImageSelectedEvent(file: imageFile),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileViewModel, EditProfileState>(
      builder: (context, state) {
        if (state.isGetUserLoading) {
          return AppShimmers.profileHeaderShimmer;
        }

        if (state.getUserFailure != null) {
          return Center(child: Text(state.getUserFailure!.errorMessage));
        }

        if (state.loggedUserData == null ||
            state.loggedUserData?.user == null) {
          return const Center(child: Text('No user data available'));
        }

        final user = state.loggedUserData!.user!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: state.selectedImage != null
                          ? Image.file(
                              state.selectedImage!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )
                          : CachedNetworkImage(
                              imageUrl: user.photo!,
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

                  Positioned(

                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        _pickImage(context);
                      },
                      child: SvgPicture.asset(
                        Assets.assetsIconsEdit,
                        width: AppSizes.icon_24,
                        height:AppSizes.icon_24,
                      ),
                    ),
                  ),
                ],
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

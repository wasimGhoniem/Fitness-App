import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/Widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_bloc.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_event.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_state.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/edit_profile_app_bar.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/edit_profile_form.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/edit_profile_header_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EditProfileViewModel>();
    return BlocListener<EditProfileViewModel, EditProfileState>(
      listenWhen: (previous, current) {
        return previous.editProfileResponse != current.editProfileResponse ||
            previous.editProfileFailure != current.editProfileFailure;
      },
      listener: (context, state) {
        if (state.editProfileResponse != null) {
          DialogueUtils.showMessage(
            context: context,
            message: 'profile updated successfully',
            posActionName: LocaleKeys.ok.tr(),
          );
        }

        if (state.editProfileFailure != null) {
          DialogueUtils.showMessage(
            context: context,
            message: state.editProfileFailure!.errorMessage,
            posActionName: LocaleKeys.ok.tr(),
          );
        }
      },
      child: GlassLayout(
        backGroundImage: Assets.assetsImagesHomeBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.spaceBetweenItems_40),

              const EditProfileAppBar(),
              const SizedBox(height: AppSizes.spaceBetweenItems_40),
              const EditProfileHeaderBlocBuilder(),
              const SizedBox(height: AppSizes.spaceBetweenItems_40),
              const EditProfileForm(),
              const SizedBox(height: AppSizes.spaceBetweenItems_40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding_32,
                ),

                child: BlocBuilder<EditProfileViewModel, EditProfileState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed: state.isDataChanged
                          ? () {
                              context.read<EditProfileViewModel>().doIntend(
                                EditProfileSubmitEvent(
                                  requestEntity: EditProfileRequestEntity(
                                    firstName: viewModel
                                        .editProfileFirstNameController
                                        .text,
                                    lastName: viewModel
                                        .editProfileLastNameController
                                        .text,
                                    email: viewModel
                                        .editProfileEmailController
                                        .text,
                                    activityLevel: viewModel
                                        .editProfileActivityLevelController
                                        .text,
                                    goal: viewModel
                                        .editProfileGoalController
                                        .text,
                                    weight:
                                        int.tryParse(
                                          viewModel
                                              .editProfileWeightController
                                              .text,
                                        ) ??
                                        0,
                                  ),
                                ),
                              );
                            }
                          : null,
                      isLoading: state.isEditProfileLoading,
                      widget: const Text('Update'),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_40),
            ],
          ),
        ),
      ),
    );
  }
}

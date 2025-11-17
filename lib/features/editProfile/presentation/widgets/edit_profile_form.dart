import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/functions/validators.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/activity_edit_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/goal_edit_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/pages/weight_edit_screen.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_bloc.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_state.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness_app/core/enum/activity_lvl_enum.dart';
import 'package:fitness_app/core/enum/goal_enum.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileViewModel viewModel = context.read<EditProfileViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_32),
      child: BlocBuilder<EditProfileViewModel, EditProfileState>(
        buildWhen: (previous, current) =>
            previous.isGetUserLoading != current.isGetUserLoading,
        builder: (context, state) {
          return Form(
            key: viewModel.editProfileFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  controller: viewModel.editProfileFirstNameController,
                  validator: (value) => Validations.validateName(value),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.first_name.tr(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.padding_16,
                        right: AppSizes.padding_4,
                      ),
                      child: Image.asset(
                        Assets.assetsIconsPersonIcon,
                        width: AppSizes.icon_18,
                        height: AppSizes.icon_18,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: AppSizes.icon_18,
                      minHeight: AppSizes.icon_18,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
                TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  controller: viewModel.editProfileLastNameController,
                  validator: (value) => Validations.validateName(value),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.last_name.tr(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.padding_16,
                        right: AppSizes.padding_4,
                      ),
                      child: Image.asset(
                        Assets.assetsIconsPersonIcon,
                        width: AppSizes.icon_18,
                        height: AppSizes.icon_18,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: AppSizes.icon_18,
                      minHeight: AppSizes.icon_18,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
                TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  controller: viewModel.editProfileEmailController,
                  validator: (value) => Validations.validateEmail(value),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.email.tr(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.padding_16,
                        right: AppSizes.padding_4,
                      ),
                      child: SvgPicture.asset(
                        Assets.assetsIconsMail,
                        width: AppSizes.icon_18,
                        height: AppSizes.icon_18,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: AppSizes.icon_18,
                      minHeight: AppSizes.icon_18,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_40),

                EditTextWidget(
                  title: 'Your Weight',
                  controller: viewModel.editProfileWeightController,
                  suffix: ' kg',
                  onTap: () async {
                    final int currentWeight =
                        int.tryParse(
                          viewModel.editProfileWeightController.text,
                        ) ??
                        70;

                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WeightEditScreen(initialWeight: currentWeight),
                      ),
                    );

                    if (result != null && result is int) {
                      viewModel.editProfileWeightController.text = result
                          .toString();
                    }
                  },
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),

                EditTextWidget(
                  title: 'Your Goal',
                  controller: viewModel.editProfileGoalController,
                  onTap: () async {
                    final GoalEnum currentGoal = GoalEnumExtension.fromApiValue(
                      viewModel.editProfileGoalController.text,
                    );

                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GoalEditScreen(initialGoal: currentGoal),
                      ),
                    );

                    if (result != null && result is GoalEnum) {
                      viewModel.editProfileGoalController.text =
                          result.apiValue;
                      viewModel.goalDisplayNotifier.value = result.displayName;
                    }
                  },
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),

                EditTextWidget(
                  title: 'Your Activity Level',
                  controller: viewModel.editProfileActivityLevelController,
                  onTap: () async {
                    final ActivityLevel currentActivity =
                        ActivityLevelExtension.fromApiValue(
                          viewModel.editProfileActivityLevelController.text,
                        );

                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityEditScreen(
                          initialActivityLevel: currentActivity,
                        ),
                      ),
                    );

                    if (result != null && result is ActivityLevel) {
                      viewModel.editProfileActivityLevelController.text =
                          result.apiValue;
                      viewModel.activityLevelDisplayNotifier.value =
                          result.displayName;
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

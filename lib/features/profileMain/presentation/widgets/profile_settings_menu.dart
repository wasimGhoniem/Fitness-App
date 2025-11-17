import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/enum/content_display_type.dart';
import 'package:fitness_app/core/helpers/dialogue_utils.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_event.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_view_model.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/custom_divider.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/language_bottom_sheet.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingsMenu extends StatelessWidget {
  const ProfileSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GlassContainer(
        contentPadding: const EdgeInsetsGeometry.symmetric(
          horizontal: AppSizes.padding_16,
          vertical: AppSizes.padding_24,
        ),
        width: double.infinity,
        body: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                SectionWidget(
                  leadingIconPath: Assets.assetsIconsSelectedProfile,
                  title: LocaleKeys.edit_profile.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: ()async {
                    final result = await context.pushNamed(AppRoutes.editProfileRoute);
                    if (result == true && context.mounted) {
                      context.read<ProfileMainViewModel>().doIntend(
                        GetLoggedUserDataEvent(),
                      );
                    }},
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsChangePassword,
                  title: LocaleKeys.change_password.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () {
                    context.pushNamed(AppRoutes.changePasswordRoute);
                  },
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsLanguageIcon,
                  title: LocaleKeys.change_language.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () => showModalBottomSheet(
                    backgroundColor: AppColorsLight.black[80],
                    context: context,
                    builder: (context) {
                      return const LanguageBottomSheet();
                    },
                  ),
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsSecurityIcon,
                  title: LocaleKeys.security.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.contentDisplayRoute,
                      arguments: ContentDisplayType.security,
                    );
                  },
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsPrivacy,
                  title: LocaleKeys.privacy_policy.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.contentDisplayRoute,
                      arguments: ContentDisplayType.privacyPolicy,
                    );
                  },
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsHelpIcon,
                  title: LocaleKeys.help.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.contentDisplayRoute,
                      arguments: ContentDisplayType.help,
                    );
                  },
                ),
                const CustomDivider(),

                SectionWidget(
                  leadingIconPath: Assets.assetsIconsLogoutIcon,
                  title: LocaleKeys.logout.tr(),
                  trailingIconPath: Assets.assetsIconsForwardArrow,
                  onTap: () {
                    DialogueUtils.showMessage(
                      context: context,
                      message: LocaleKeys.logout_confirmation_message.tr(),
                      posActionName: LocaleKeys.yes.tr(),
                      ngeActionName: LocaleKeys.no.tr(),
                      posAction: () {
                        context.read<ProfileMainViewModel>().doIntend(
                          LogoutEvent(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

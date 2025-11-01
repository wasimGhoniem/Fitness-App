import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.navBarHeight_69,
      margin: const EdgeInsets.only(
        left: AppSizes.padding_32,
        right: AppSizes.padding_32,
        bottom: AppSizes.padding_32,
      ),
      decoration: const BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.padding_20),
        child: BottomNavigationBar(
          showUnselectedLabels: false,

          backgroundColor: AppColorsLight.glassContainerColor,

          currentIndex: currentIndex,
          onTap: onChanged,
          items: [
            BottomNavigationBarItem(
              label: LocaleKeys.explore.tr(),
              activeIcon: SvgPicture.asset(Assets.assetsIconsSelectedHome),
              icon: SvgPicture.asset(Assets.assetsIconsUnselectedHome),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.smart_coach.tr(),
              activeIcon: SvgPicture.asset(Assets.assetsIconsSelectedChatAi),
              icon: SvgPicture.asset(Assets.assetsIconsUnselectedChatAi),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.workouts.tr(),
              activeIcon: SvgPicture.asset(Assets.assetsIconsSelectedGym),
              icon: SvgPicture.asset(Assets.assetsIconsUnselectedGym),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.profile.tr(),
              activeIcon: SvgPicture.asset(Assets.assetsIconsSelectedProfile),
              icon: SvgPicture.asset(Assets.assetsIconsUnselectedProfile),
            ),
          ],
        ),
      ),
    );
  }
}

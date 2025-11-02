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
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Assets.assetsIconsSelectedHome,
        Assets.assetsIconsUnselectedHome,
        LocaleKeys.explore.tr(),
      ),
      (
        Assets.assetsIconsSelectedChatAi,
        Assets.assetsIconsUnselectedChatAi,
        LocaleKeys.smart_coach.tr(),
      ),
      (
        Assets.assetsIconsSelectedGym,
        Assets.assetsIconsUnselectedGym,
        LocaleKeys.workouts.tr(),
      ),
      (
        Assets.assetsIconsSelectedProfile,
        Assets.assetsIconsUnselectedProfile,
        LocaleKeys.profile.tr(),
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(
        left: AppSizes.padding_32,
        right: AppSizes.padding_32,
        bottom: AppSizes.padding_32,
      ),
      padding: const EdgeInsets.all(AppSizes.padding_16),
      decoration: BoxDecoration(
        color: AppColorsLight.glassContainerColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((item) {
          final index = item.key;
          final value = item.value;
          return ButtomNavBarItem(
            isSelected: currentIndex == index,
            selectedIcon: value.$1,
            unselectedIcon: value.$2,
            label: value.$3,
            onTap: () => onTap(index),
          );
        }).toList(),
      ),
    );
  }
}

class ButtomNavBarItem extends StatelessWidget {
  const ButtomNavBarItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });

  final void Function() onTap;
  final bool isSelected;
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? selectedIcon : unselectedIcon,
            height: 28,
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_4),
          Visibility(
            visible: isSelected,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

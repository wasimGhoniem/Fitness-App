import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding_16,
          vertical: AppSizes.padding_8,
        ),
        margin: const EdgeInsets.only(
          left: AppSizes.padding_16,
          right: AppSizes.padding_16,
          bottom: AppSizes.padding_16,
        ),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: AppColorsLight.black[20]!.withOpacity(0.2),
          border: Border.all(color: AppColorsLight.black[10]!),
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorsLight.black[20],
                fontWeight: FontWeight.w700,
              ),
            ),
            SvgPicture.asset(
              isSelected
                  ? Assets.assetsIconsSelectedRadio
                  : Assets.assetsIconsUnselectedRadio,
            ),
          ],
        ),
      ),
    );
  }
}

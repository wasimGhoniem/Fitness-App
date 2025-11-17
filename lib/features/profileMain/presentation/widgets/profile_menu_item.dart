import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class ProfileMenuItem extends StatelessWidget {

  const ProfileMenuItem({
    super.key,
    this.leadingIcon,
    this.trailing,
    required this.title,
    this.onTap,
  });
  final Widget? leadingIcon;
  final Widget? trailing;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
      child: Row(
        children: [
          leadingIcon ?? const SizedBox(),
          const SizedBox(width: AppSizes.spaceBetweenItems_2),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: trailing ??
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColorsLight.gray,
                  size: AppSizes.icon_16,
                ),
          ),
        ],
      ),
    );
  }
}

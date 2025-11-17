import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.leadingIconPath,
    required this.title,
    required this.trailingIconPath,
    this.onTap,
  });

  final String leadingIconPath;
  final String trailingIconPath;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(leadingIconPath),
          const SizedBox(width: AppSizes.spaceBetweenItems_16),
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          const Spacer(),
         SvgPicture.asset(trailingIconPath),
        ],
      ),
    );
  }
}

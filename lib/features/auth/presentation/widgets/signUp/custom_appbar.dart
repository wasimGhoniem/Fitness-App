import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarr extends StatelessWidget {
  const CustomAppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding_16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: SvgPicture.asset(Assets.assetsIconsBackSvg),
          ),
        ),
        const Spacer(),
        Image.asset(Assets.assetsImagesFitLogo),
        const Spacer(),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.assetsIconsBackSvg),
        ),
        const SizedBox(width: 80),
        Text('profile'.tr(), style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

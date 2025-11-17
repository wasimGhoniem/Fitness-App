import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context, true),
          icon: SvgPicture.asset(Assets.assetsIconsBackSvg),
        ),

        const SizedBox(width: 80),

        Text(
          LocaleKeys.edit_profile.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

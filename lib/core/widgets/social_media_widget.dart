import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.onFaceBookTap,
    required this.onGoogleTap,
    required this.onAppleTap,
  });
  final void Function()? onFaceBookTap;
  final void Function()? onGoogleTap;
  final void Function()? onAppleTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFaceBookTap,
          icon: SvgPicture.asset(Assets.assetsIconsFacebook),
        ),
        IconButton(
          onPressed: onGoogleTap,
          icon: SvgPicture.asset(Assets.assetsIconsGoogle),
        ),
        IconButton(
          onPressed: onAppleTap,
          icon: SvgPicture.asset(Assets.assetsIconsApple),
        ),
      ],
    );
  }
}

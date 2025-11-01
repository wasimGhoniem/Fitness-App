import 'package:fitness_app/core/enum/gender_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GinderImageWidget extends StatelessWidget {
  const GinderImageWidget({
    super.key,
    required this.gender,
    required this.iconPath,
    required this.genderEnumNotifier,
  });
  final GenderEnum gender;
  final String iconPath;
  final ValueNotifier<GenderEnum?> genderEnumNotifier;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        genderEnumNotifier.value = gender;
      },
      child: SvgPicture.asset(iconPath),
    );
  }
}

import 'package:fitness_app/core/enum/gender_enum.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/ginder_image_widget.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key, required this.genderEnumNotifier});
  final ValueNotifier<GenderEnum?> genderEnumNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GinderImageWidget(
          gender: GenderEnum.male,
          iconPath: genderEnumNotifier.value == GenderEnum.male
              ? Assets.assetsIconsMaleSelected
              : Assets.assetsIconsMale,
          genderEnumNotifier: genderEnumNotifier,
        ),
        const SizedBox(height: AppSizes.spaceBetweenItems_24),
        GinderImageWidget(
          gender: GenderEnum.female,
          iconPath: genderEnumNotifier.value == GenderEnum.female
              ? Assets.assetsIconsFemaleSelected
              : Assets.assetsIconsFemale,
          genderEnumNotifier: genderEnumNotifier,
        ),
      ],
    );
  }
}

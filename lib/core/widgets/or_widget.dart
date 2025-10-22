import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: width * 0.15,
              right: AppSizes.padding_20,
            ),
            height: 1,
            color: AppColorsLight.black[20],
          ),
        ),
        Text('Or', style: Theme.of(context).textTheme.labelMedium),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: AppSizes.padding_20,
              right: width * 0.15,
            ),
            height: 1,
            color: AppColorsLight.black[20],
          ),
        ),
      ],
    );
  }
}

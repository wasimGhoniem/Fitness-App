import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AiScreenBody extends StatelessWidget {
  const AiScreenBody({super.key, required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;
  @override
  Widget build(BuildContext context) {
    return GlassLayout(
      backGroundImage: Assets.assetsImagesChatBg,
      child: Column(
        children: [
          const SizedBox(height: AppSizes.spaceBetweenItems_32),
          AiHeader(globalKey: globalKey),
          const SizedBox(height: AppSizes.spaceBetweenItems_24),
          const AiBody(),
          const AiFooter(),
          const SizedBox(height: AppSizes.spaceBetweenItems_32),
        ],
      ),
    );
  }
}

class AiBody extends StatelessWidget {
  const AiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Image.asset(Assets.assetsImagesRobotImage, width: double.infinity),
    );
  }
}

class AiFooter extends StatelessWidget {
  const AiFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      contentPadding: const EdgeInsetsGeometry.symmetric(
        horizontal: AppSizes.padding_32,
        vertical: AppSizes.padding_36,
      ),
      body: [
        const Text(
          'How Can I Assist You\n Today ?',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.spaceBetweenItems_12),
        CustomElevatedButton(
          onPressed: () {},
          isLoading: false,
          widget: const Text('Ger Started'),
        ),
      ],
      width: double.infinity,
    );
  }
}

class AiHeader extends StatelessWidget {
  const AiHeader({super.key, required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () =>
                context.pushReplacementNamed(AppRoutes.mainLayoutRoute),
            child: SvgPicture.asset(Assets.assetsIconsBackSvg),
          ),
          const Column(
            children: [Text('Hi Ahmed ,'), Text('I am your smart coach')],
          ),
          GestureDetector(
            onTap: () => globalKey.currentState!.openDrawer(),
            child: Image.asset(
              Assets.assetsIconsThreeLinesIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class GlassLayout extends StatelessWidget {
  const GlassLayout({
    super.key,
    required this.body,
    required this.backGroundImage,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> body;
  final String backGroundImage;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backGroundImage,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ).blurred(
          blurColor: Theme.of(context).colorScheme.secondary,
          colorOpacity: 0.2,
          blur: 4,
        ),
        CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: body,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class GlassLayout extends StatelessWidget {
  const GlassLayout({
    super.key,

    required this.backGroundImage,
    required this.child,
  });

  final String backGroundImage;
  final Widget child;

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
        child,
      ],
    );
  }
}

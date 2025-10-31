import 'package:flutter/material.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
    required this.tabsLength,
    required this.taps,
    required this.onTap,
    required this.initialIndex,
  });

  final int tabsLength;
  final List<Widget> taps;
  final void Function(int)? onTap;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabsLength,
      child: TabBar(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        physics: const BouncingScrollPhysics(),
        isScrollable: true,
        tabs: taps,
        onTap: onTap,
      ),
    );
  }
}

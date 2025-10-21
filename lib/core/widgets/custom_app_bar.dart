import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onTap, required this.title});

  final VoidCallback? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: AppSizes.padding_16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap ?? context.pop,
              // get from svg and change icon
              child: const Icon(Icons.arrow_back_ios, size: 20),
            ),
            //check this size of text
            Text(title, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight_29);
}

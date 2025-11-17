import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/helpers/app_config_cubit.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';



class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding_16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Divider(
              color: AppColorsLight.black,
              thickness: 4,
              indent: 120,
              endIndent: 120,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_16),
          Text(
            LocaleKeys.change_language.tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_16),
          _buildLanguageTile(
            context: context,
            title: LocaleKeys.arabic.tr(),
            locale: const Locale(AppConstants.ar),
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems_16),
          _buildLanguageTile(
            context: context,
            title: LocaleKeys.english.tr(),
            locale: const Locale(AppConstants.en),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required String title,
    required Locale locale,
  }) {
    return BlocBuilder<AppConfigCubit, Locale>(
      builder: (context, currentLocale) {
        final isSelected = currentLocale.languageCode == locale.languageCode;

        return Material(
          elevation: 2,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius_8),
          child: ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.borderRadius_8),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            tileColor: AppColorsLight.white,
            trailing: isSelected
                ? SvgPicture.asset(
                    Assets.assetsIconsSelectedRadio,
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  )
                : SvgPicture.asset(
                    Assets.assetsIconsUnselectedRadio,
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
            onTap: () {
              context.read<AppConfigCubit>().changeLanguage(locale);
              context.setLocale(locale);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_state.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_view_model.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/profile_app_bar.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/profile_header_bloc_builder.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/profile_settings_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileMainViewModel, ProfileMainState>(
      listener: (context, state) {
        if (state.isLoggedOut) {
          context.pushNamedAndRemoveUntil(
            AppRoutes.signInRoute,
            predicate: (route) => false,
          );
        }
      },
      child: const GlassLayout(
        backGroundImage: Assets.assetsImagesHomeBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSizes.spaceBetweenItems_40),
              ProfileAppBar(),
              SizedBox(height: AppSizes.spaceBetweenItems_40),
          
              ProfileHeaderBlocBuilder(),
              SizedBox(height: AppSizes.spaceBetweenItems_40),
          
              ProfileSettingsMenu(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

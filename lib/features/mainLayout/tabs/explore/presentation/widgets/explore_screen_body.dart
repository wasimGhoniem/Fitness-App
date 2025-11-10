import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/dummy/dummy_data.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/models/selected_food_category_model.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_event.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscles_group_by_id_list_view_bloc_builder.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/muscles_list_view_bloc_builder.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/profile_bloc_builder.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/recommended_for_you_list_view.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/recommended_text_widget.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/sections_header.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/taps_bloc_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreenBody extends StatefulWidget {
  const ExploreScreenBody({super.key});

  @override
  State<ExploreScreenBody> createState() => _ExploreScreenBodyState();
}

class _ExploreScreenBodyState extends State<ExploreScreenBody> {
  late final ExploreViewModel _exploreViewModel;
  @override
  void initState() {
    _exploreViewModel = getIt<ExploreViewModel>();
    _exploreViewModel.doIntent(
      GetAllExploreEvent(id: AppConstants.abdominalsId),
    );
    super.initState();
  }

  @override
  void dispose() {
    _exploreViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _exploreViewModel,
      child: GlassLayout(
        backGroundImage: Assets.assetsImagesHomeBgBigWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.spaceBetweenItems_40),
              const ProfileBlocBuilder(),
              const SizedBox(height: AppSizes.spaceBetweenItems_24),
              const RecommendationToDayTextWidget(),
              const MusclesListViewBlocBuilder(),
              const SizedBox(height: AppSizes.spaceBetweenItems_24),
              SectionHeader(
                title: LocaleKeys.upcoming_workouts.tr(),
                onTap: () {
                  context.pushReplacementNamed(
                    AppRoutes.mainLayoutRoute,
                    arguments: 2,
                  );
                },
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_8),
              const TapsBlocBuilder(),
              const SizedBox(height: AppSizes.spaceBetweenItems_8),
              const MusclesGroupByIdListViewwBlocBuilder(),
              const SizedBox(height: AppSizes.spaceBetweenItems_24),
              SectionHeader(
                title: LocaleKeys.recommended_for_you.tr(),
                onTap: () {
                  final arg = SelectedFoodCategoryModel(
                    mealCategoryName: '',
                    selectedIndex: 0,
                  );
                  context.pushNamed(AppRoutes.foodRoute, arguments: arg);
                },
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems_8),
              BlocBuilder<ExploreViewModel, ExploreState>(
                builder: (context, state) {
                  if (state.isCategoriesLoading) {
                    return ReccomendedForYouListView(
                      isLoading: true,
                      musclesList: mealCategoryDummyList,
                    );
                  }
                  if (state.categoriesFailure != null) {
                    return Center(
                      child: Text(state.categoriesFailure!.errorMessage),
                    );
                  }
                  return ReccomendedForYouListView(
                    isLoading: false,
                    musclesList: state.categoriesResponse!.categories!,
                  );
                },
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}

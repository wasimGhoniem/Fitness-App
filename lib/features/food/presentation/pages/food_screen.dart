import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/models/selected_food_category_model.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_event.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_view_model.dart';
import 'package:fitness_app/features/food/presentation/widgets/meals_bloc_builder.dart';
import 'package:fitness_app/features/food/presentation/widgets/tabs_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key, required this.selectedFoodCategoryModel});

  final SelectedFoodCategoryModel selectedFoodCategoryModel;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late final FoodViewModel _viewModel;

  @override
  void initState() {
    _viewModel = getIt<FoodViewModel>();
    _viewModel.doIntent(
      LoadAllFoodDataEvent(
        mealCategoryName: widget.selectedFoodCategoryModel.mealCategoryName,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: Scaffold(
        body: GlassLayout(
          backGroundImage: Assets.assetsImagesHomeBg,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding_16,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSizes.spaceBetweenItems_40),
                      Row(
                        children: [
                          InkWell(
                            child: SvgPicture.asset(Assets.assetsIconsBackSvg),
                            onTap: () {
                              context.pop();
                            },
                          ),
                          const SizedBox(width: AppSizes.spaceBetweenItems_24),
                          Text(
                            LocaleKeys.food_recommendation.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_24),
                      TabsBlocBuilder(
                        initialIndex:
                            widget.selectedFoodCategoryModel.selectedIndex,
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_24),
                    ],
                  ),
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.padding_16,
                  ),
                  child: MealsBlocBuilder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

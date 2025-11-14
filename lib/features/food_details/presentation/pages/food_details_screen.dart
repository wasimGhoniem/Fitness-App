import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/helpers/routing_extensions.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/food/presentation/widgets/app_shimmers.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/food_details/presentation/viewModel/food_details_event.dart';
import 'package:fitness_app/features/food_details/presentation/viewModel/food_details_state.dart';
import 'package:fitness_app/features/food_details/presentation/viewModel/food_details_view_model.dart';
import 'package:fitness_app/features/food_details/presentation/widget/food_details_error_view.dart';
import 'package:fitness_app/features/food_details/presentation/widget/food_details_header_section.dart';
import 'package:fitness_app/features/food_details/presentation/widget/ingredient_item.dart';
import 'package:fitness_app/features/food_details/presentation/widget/ingredients_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key, required this.mealId});

  final String mealId;

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late final FoodDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<FoodDetailsViewModel>()
      ..doIntent(LoadFoodDetailsEvent(mealId: widget.mealId));
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
        body: BlocBuilder<FoodDetailsViewModel, FoodDetailsState>(
          builder: (BuildContext context, FoodDetailsState state) {
            if (state.isLoading) {
              return AppShimmers.foodDetailsShimmer();
            }

            if (state.failure != null) {
              return FoodDetailsErrorView(
                message: state.failure!.errorMessage,
                onRetry: () {
                  context.read<FoodDetailsViewModel>().doIntent(
                    LoadFoodDetailsEvent(mealId: widget.mealId),
                  );
                },
              );
            }

            final MealEntity mealDetails = state.MealDetails!;

            return GlassLayout(
              backGroundImage: Assets.assetsImagesHomeBg,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodDetailsHeaderSection(
                      videoUrl: mealDetails.youtubeUrl!,
                      imageUrl: mealDetails.imageUrl!,
                      title: mealDetails.name,
                      subtitle: mealDetails.instructions!,
                      onBack: () => context.pop(),
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.borderRadius_16,
                      ),
                      child: IngredientsTitle(
                        textStyle: Theme.of(context).textTheme.bodyLarge!,
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding_12),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.borderRadius_16,
                      ),
                      child: IngredientsList(
                        ingredients: mealDetails.ingredients,
                        measures: mealDetails.measures,
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

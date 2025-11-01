import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';

abstract interface class FoodRemoteDataSource {
  Future<ApiResult<MealsCategoriesResponseEntity>> getMealsCategories();

  Future<ApiResult<MealsByCategoryResponseEntity>> getMealsByCategory({
    required String mealCategoryName,
  });
}

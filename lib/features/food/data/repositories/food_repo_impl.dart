import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/data/dataSources/food_remote_data_source.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/repositories/food_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRepo)
class FoodRepoImpl implements FoodRepo {
  FoodRepoImpl(this._foodRemoteDataSource);

  final FoodRemoteDataSource _foodRemoteDataSource;

  @override
  Future<ApiResult<MealsByCategoryResponseEntity>> getMealsByCategory({
    required String mealCategoryName,
  }) {
    return _foodRemoteDataSource.getMealsByCategory(
      mealCategoryName: mealCategoryName,
    );
  }

  @override
  Future<ApiResult<MealsCategoriesResponseEntity>> getMealsCategories() {
    return _foodRemoteDataSource.getMealsCategories();
  }
}

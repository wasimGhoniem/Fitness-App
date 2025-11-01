import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/repositories/food_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsByCategoryUseCase {
  GetMealsByCategoryUseCase(this._foodRepo);

  final FoodRepo _foodRepo;

  Future<ApiResult<MealsByCategoryResponseEntity>> invoke({
    required String mealCategoryName,
  }) {
    return _foodRepo.getMealsByCategory(mealCategoryName: mealCategoryName);
  }
}

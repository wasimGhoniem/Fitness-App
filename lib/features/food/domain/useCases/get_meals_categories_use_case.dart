import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/repositories/food_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsCategoriesUseCase {
  GetMealsCategoriesUseCase(this._foodRepo);

  final FoodRepo _foodRepo;

  Future<ApiResult<MealsCategoriesResponseEntity>> invoke() {
    return _foodRepo.getMealsCategories();
  }
}

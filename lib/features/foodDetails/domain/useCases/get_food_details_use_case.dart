import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';
import 'package:fitness_app/features/foodDetails/domain/repositories/food_details_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFoodDetailsUseCase {
  GetFoodDetailsUseCase(this._repository);

  final FoodDetailsRepository _repository;

  Future<ApiResult<MealDetailsResponseEntity>> invoke(String mealId) {
    return _repository.getMealDetails(mealId);
  }
}

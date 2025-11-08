import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_details_response_entity.dart';

abstract interface class FoodDetailsRemoteDataSource {
  Future<ApiResult<MealDetailsResponseEntity>> getMealDetails(String mealId);
}

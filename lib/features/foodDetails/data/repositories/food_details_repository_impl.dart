import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/foodDetails/data/dataSources/food_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';
import 'package:fitness_app/features/foodDetails/domain/repositories/food_details_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FoodDetailsRepository)
class FoodDetailsRepositoryImpl implements FoodDetailsRepository {
  FoodDetailsRepositoryImpl(this._remoteDataSource);

  final FoodDetailsRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<MealDetailsResponseEntity>> getMealDetails(String mealId) {
    return _remoteDataSource.getMealDetails(mealId);
  }
}

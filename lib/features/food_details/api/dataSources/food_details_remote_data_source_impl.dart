import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/food_details/api/client/food_details_api_service.dart';
import 'package:fitness_app/features/food_details/api/mapper/meal_details_response_mapper.dart';
import 'package:fitness_app/features/food_details/api/model/meal_details_response_dto.dart';
import 'package:fitness_app/features/food_details/data/dataSources/food_details_remote_data_source.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_details_response_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FoodDetailsRemoteDataSource)
class FoodDetailsRemoteDataSourceImpl implements FoodDetailsRemoteDataSource {
  FoodDetailsRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final FoodDetailsApiService _apiService;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<MealDetailsResponseEntity>> getMealDetails(String mealId) {
    return _remoteExecutor
        .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
          request: () => _apiService.getMealDetails(mealId),
          mapper: (response) => response.toEntity(),
        );
  }
}

import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/food/api/client/food_api_service.dart';
import 'package:fitness_app/features/food/api/mapper/meals_by_category_response_mapper.dart';
import 'package:fitness_app/features/food/api/mapper/meals_categories_response_mapper.dart';
import 'package:fitness_app/features/food/api/model/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/food/api/model/meals_categories_response_dto.dart';
import 'package:fitness_app/features/food/data/dataSources/food_remote_data_source.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRemoteDataSource)
class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  FoodRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._apiRemoteExecutor,
  );

  final FoodApiService _apiService;
  final RemoteExecutor _apiRemoteExecutor;

  @override
  Future<ApiResult<MealsByCategoryResponseEntity>> getMealsByCategory({
    required String mealCategoryName,
  }) {
    return _apiRemoteExecutor
        .execute<MealsByCategoryResponseDto, MealsByCategoryResponseEntity>(
          request: () => _apiService.getMealsByCategory(mealCategoryName),
          mapper: (response) => response.toEntity(),
        );
  }

  @override
  Future<ApiResult<MealsCategoriesResponseEntity>> getMealsCategories() {
    return _apiRemoteExecutor
        .execute<MealsCategoriesResponseDto, MealsCategoriesResponseEntity>(
          request: () => _apiService.getMealsCategories(),
          mapper: (response) => response.toEntity(),
        );
  }
}

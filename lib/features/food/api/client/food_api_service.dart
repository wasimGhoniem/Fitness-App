import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/food/api/model/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/food/api/model/meals_categories_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'food_api_service.g.dart';

@singleton
@RestApi()
abstract class FoodApiService {
  @factoryMethod
  factory FoodApiService(@Named(ApiConstants.mealsDio)Dio dio) = _FoodApiService;

  @GET(ApiConstants.mealsCategories)
  Future<MealsCategoriesResponseDto> getMealsCategories();

  @GET(ApiConstants.mealsByCategory)
  Future<MealsByCategoryResponseDto> getMealsByCategory(
      @Query(ApiConstants.mealsByCategoryQuery)  String mealCategoryName,
      );
}

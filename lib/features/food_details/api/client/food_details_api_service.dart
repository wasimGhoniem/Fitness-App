import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/food_details/api/model/meal_details_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'food_details_api_service.g.dart';

@singleton
@RestApi()
abstract class FoodDetailsApiService {
  @factoryMethod
  factory FoodDetailsApiService(
    @Named(ApiConstants.mealsDio) Dio dio,
  ) = _FoodDetailsApiService;

  @GET(ApiConstants.mealsDetails)
  Future<MealDetailsResponseDto> getMealDetails(
    @Query(ApiConstants.mealsIdQuery) String mealId,
  );
}


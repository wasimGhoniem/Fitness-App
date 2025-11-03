import 'package:fitness_app/features/food_details/api/mapper/meal_mapper.dart';
import 'package:fitness_app/features/food_details/api/model/meal_details_response_dto.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_details_response_entity.dart';

extension MealDetailsResponseMapper on MealDetailsResponseDto {
  MealDetailsResponseEntity toEntity() {
    final mealList = meals?.map((m) => m.toEntity()).toList() ?? [];
    return MealDetailsResponseEntity(meals: mealList);
  }
}

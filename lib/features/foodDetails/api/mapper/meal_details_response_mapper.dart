import 'package:fitness_app/features/foodDetails/api/mapper/meal_mapper.dart';
import 'package:fitness_app/features/foodDetails/api/model/meal_details_response_dto.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';

extension MealDetailsResponseMapper on MealDetailsResponseDto {
  MealDetailsResponseEntity toEntity() {
    final mealList = meals?.map((m) => m.toEntity()).toList() ?? [];
    return MealDetailsResponseEntity(meals: mealList);
  }
}

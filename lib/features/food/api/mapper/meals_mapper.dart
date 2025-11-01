import 'package:fitness_app/features/food/api/model/meals_dto.dart';
import 'package:fitness_app/features/food/domain/entity/meals_entity.dart';

extension MealsDtoMapper on MealsDto {
  MealsEntity toEntity() {
    return MealsEntity(
      mealId: idMeal ?? '',
      mealName: strMeal ?? '',
      mealPhoto: strMealThumb ?? '',
    );
  }
}

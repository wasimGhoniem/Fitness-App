import 'package:fitness_app/features/food/api/mapper/meal_category_mapper.dart';
import 'package:fitness_app/features/food/api/model/meals_categories_response_dto.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';

extension MealsCategoriesResponseDtoMapper on MealsCategoriesResponseDto {
  MealsCategoriesResponseEntity toEntity() {
    return MealsCategoriesResponseEntity(
      categories:
          categories?.map((categoryDto) => categoryDto.toEntity()).toList() ??
          [],
    );
  }
}

import 'package:fitness_app/features/food/api/mapper/meals_mapper.dart';
import 'package:fitness_app/features/food/api/model/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';

extension MealsByCategoryResponseDtoMapper on MealsByCategoryResponseDto {
  MealsByCategoryResponseEntity toEntity() {
    return MealsByCategoryResponseEntity(
      meals: meals?.map((mealDto) => mealDto.toEntity()).toList() ?? [],
    );
  }
}

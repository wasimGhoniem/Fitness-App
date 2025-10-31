import 'package:fitness_app/features/food/api/model/meal_category_dto.dart';
import 'package:fitness_app/features/food/domain/entity/meal_category_entity.dart';

extension MealCategoryDtoMapper on MealCategoryDto {
  MealCategoryEntity toEntity() {
    return MealCategoryEntity(
      categoryId: idCategory ?? '',
      categoryName: strCategory ?? '',
      categoryPhoto: strCategoryThumb ?? '',
      categoryDescription: strCategoryDescription ?? '',
    );
  }
}

import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/meal_categories_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/meal_category_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/meal_categories_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/meal_category_entity.dart';

extension MealCategoriesResponseMapper on MealCategoriesResponseDto {
  MealCategoriesResponseEntity toEntity() {
    return MealCategoriesResponseEntity(
      categories:
          categories?.map((e) => e.toEntity()).toList(growable: false) ?? [],
    );
  }
}

extension MealCategoryMapper on MealCategoryDto {
  MealCategoryEntity toEntity() {
    return MealCategoryEntity(
      id: idCategory ?? '',
      name: strCategory ?? '',
      thumbnailUrl: strCategoryThumb ?? '',
      description: strCategoryDescription ?? '',
    );
  }
}

import 'package:fitness_app/features/food/domain/entity/meal_category_entity.dart';

class MealsCategoriesResponseEntity {
  const MealsCategoriesResponseEntity({this.categories});

  final List<MealCategoryEntity>? categories;
}

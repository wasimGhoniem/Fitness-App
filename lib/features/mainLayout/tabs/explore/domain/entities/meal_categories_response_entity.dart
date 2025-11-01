import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/meal_category_entity.dart';

class MealCategoriesResponseEntity {
  const MealCategoriesResponseEntity({required this.categories});

  final List<MealCategoryEntity> categories;
}

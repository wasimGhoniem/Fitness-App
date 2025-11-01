import 'package:fitness_app/features/food/domain/entity/meals_entity.dart';

class MealsByCategoryResponseEntity {
  const MealsByCategoryResponseEntity({this.meals});

  final List<MealsEntity>? meals;
}

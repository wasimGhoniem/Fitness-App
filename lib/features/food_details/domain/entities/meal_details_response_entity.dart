import 'package:fitness_app/features/food_details/domain/entities/meal_entity.dart';

class MealDetailsResponseEntity {
  MealDetailsResponseEntity({this.meals});
  final List<MealEntity>? meals;
}

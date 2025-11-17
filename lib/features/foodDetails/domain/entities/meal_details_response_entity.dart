import 'package:fitness_app/features/foodDetails/domain/entities/meal_entity.dart';

class MealDetailsResponseEntity {
  MealDetailsResponseEntity({this.meals});
  final List<MealEntity>? meals;
}

import 'package:fitness_app/features/food_details/api/model/meal_dto.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_entity.dart';

extension MealMapper on MealDto {
  MealEntity toEntity() {
    final ingredients =
        [
              strIngredient1,
              strIngredient2,
              strIngredient3,
              strIngredient4,
              strIngredient5,
              strIngredient6,
              strIngredient7,
              strIngredient8,
              strIngredient9,
              strIngredient10,
              strIngredient11,
              strIngredient12,
              strIngredient13,
              strIngredient14,
              strIngredient15,
              strIngredient16,
              strIngredient17,
              strIngredient18,
              strIngredient19,
              strIngredient20,
            ]
            .where((i) => i != null && i.trim().isNotEmpty)
            .map((i) => i!.trim())
            .toList();

    if (ingredients.isEmpty) {
      ingredients.add('No ingredients available');
    }

    final measures =
        [
              strMeasure1,
              strMeasure2,
              strMeasure3,
              strMeasure4,
              strMeasure5,
              strMeasure6,
              strMeasure7,
              strMeasure8,
              strMeasure9,
              strMeasure10,
              strMeasure11,
              strMeasure12,
              strMeasure13,
              strMeasure14,
              strMeasure15,
              strMeasure16,
              strMeasure17,
              strMeasure18,
              strMeasure19,
              strMeasure20,
            ]
            .where((m) => m != null && m.trim().isNotEmpty)
            .map((m) => m!.trim())
            .toList();

    if (measures.isEmpty) {
      measures.add('N/A');
    }

    return MealEntity(
      id: (idMeal ?? '0').trim(),
      name: (strMeal ?? 'Unknown Meal').trim(),
      category: (strCategory ?? 'Uncategorized').trim(),
      area: (strArea ?? 'Unknown Area').trim(),
      instructions: (strInstructions ?? 'No instructions available').trim(),
      imageUrl: (strMealThumb ?? '').trim(),
      youtubeUrl: (strYoutube ?? '').trim(),
      ingredients: ingredients,
      measures: measures,
      tags: (strTags ?? 'No tags').trim(),
      source: (strSource ?? 'No source').trim(),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';

class FoodState extends Equatable {

  const FoodState({
    this.isCategoriesLoading = true,
    this.isMealsLoading = true,
    this.categoriesFailure,
    this.mealsFailure,
    this.categoriesResponse,
    this.mealsResponse,
  });
  final bool isCategoriesLoading;
  final bool isMealsLoading;

  final Failure? categoriesFailure;
  final Failure? mealsFailure;

  final MealsCategoriesResponseEntity? categoriesResponse;
  final MealsByCategoryResponseEntity? mealsResponse;

  FoodState copyWith({
    bool? isCategoriesLoading,
    bool? isMealsLoading,
    Failure? categoriesFailure,
    Failure? mealsFailure,
    MealsCategoriesResponseEntity? categoriesResponse,
    MealsByCategoryResponseEntity? mealsResponse,
  }) {
    return FoodState(
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      isMealsLoading: isMealsLoading ?? this.isMealsLoading,
      categoriesFailure: categoriesFailure ?? this.categoriesFailure,
      mealsFailure: mealsFailure ?? this.mealsFailure,
      categoriesResponse: categoriesResponse ?? this.categoriesResponse,
      mealsResponse: mealsResponse ?? this.mealsResponse,
    );
  }

  @override
  List<Object?> get props => [
    isCategoriesLoading,
    isMealsLoading,
    categoriesFailure,
    mealsFailure,
    categoriesResponse,
    mealsResponse,
  ];
}

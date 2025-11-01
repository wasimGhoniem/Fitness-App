sealed class FoodEvent {}

class GetAllMealCategoriesEvent extends FoodEvent {}

class GetMealsByCategoryEvent extends FoodEvent {
  GetMealsByCategoryEvent({required this.mealCategoryName});

  final String mealCategoryName;
}

class LoadAllFoodDataEvent extends FoodEvent {
  LoadAllFoodDataEvent({required this.mealCategoryName});

  final String mealCategoryName;
}

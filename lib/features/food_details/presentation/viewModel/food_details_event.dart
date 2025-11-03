sealed class FoodDetailsEvent {}

class LoadFoodDetailsEvent extends FoodDetailsEvent {
  LoadFoodDetailsEvent({required this.mealId});

  final String mealId;
}



import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food_details/domain/entities/meal_entity.dart';

class FoodDetailsState extends Equatable {
  const FoodDetailsState({
    this.isLoading = true,
    this.failure,
    this.MealDetails,
  });

  final bool isLoading;
  final Failure? failure;
  final MealEntity? MealDetails;

  FoodDetailsState copyWith({
    bool? isLoading,
    Failure? failure,
    MealEntity? MealDetails,
  }) {
    return FoodDetailsState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
      MealDetails: MealDetails ?? this.MealDetails,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, failure, MealDetails];
}

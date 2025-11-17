import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';
import 'package:fitness_app/features/foodDetails/domain/useCases/get_food_details_use_case.dart';
import 'package:fitness_app/features/foodDetails/presentation/viewModel/food_details_event.dart';
import 'package:fitness_app/features/foodDetails/presentation/viewModel/food_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FoodDetailsViewModel extends Cubit<FoodDetailsState> {
  FoodDetailsViewModel(this._getFoodDetailsUseCase)
    : super(const FoodDetailsState());

  final GetFoodDetailsUseCase _getFoodDetailsUseCase;

  Future<void> doIntent(FoodDetailsEvent event) async {
    switch (event) {
      case LoadFoodDetailsEvent():
        await _loadFoodDetails(event.mealId);
        break;
    }
  }

  Future<void> _loadFoodDetails(String mealId) async {
    final ApiResult<MealDetailsResponseEntity> result =
        await _getFoodDetailsUseCase.invoke(mealId);

    switch (result) {
      case ApiSuccessResult<MealDetailsResponseEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            MealDetails: result.data.meals?.first,
          ),
        );
        break;
      case ApiErrorResult<MealDetailsResponseEntity>():
        emit(state.copyWith(isLoading: false, failure: result.failure));
        break;
    }
  }
}

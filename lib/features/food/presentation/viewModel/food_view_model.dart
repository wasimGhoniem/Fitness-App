import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_by_category_use_case.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_categories_use_case.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_event.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FoodViewModel extends Cubit<FoodState> {
  FoodViewModel(
    this._getMealsCategoriesUseCase,
    this._getMealsByCategoryUseCase,
  ) : super(const FoodState());
  final GetMealsCategoriesUseCase _getMealsCategoriesUseCase;
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase;

  Future<void> doIntent(FoodEvent event) async {
    switch (event) {
      case GetAllMealCategoriesEvent():
        await _getAllMealCategories();
        break;

      case GetMealsByCategoryEvent():
        await _getMealsByCategory(event.mealCategoryName);
        break;
      case LoadAllFoodDataEvent():
        _getAllFoodData(event.mealCategoryName);
        break;
    }
  }

  void _getAllFoodData(String mealCategoryName) {
    _getAllMealCategories();
    _getMealsByCategory(mealCategoryName);
  }

  Future<void> _getAllMealCategories() async {
    final result = await _getMealsCategoriesUseCase.invoke();

    switch (result) {
      case ApiSuccessResult<MealsCategoriesResponseEntity>():
        emit(
          state.copyWith(
            isCategoriesLoading: false,
            categoriesResponse: result.data,
          ),
        );
        break;

      case ApiErrorResult<MealsCategoriesResponseEntity>():
        emit(
          state.copyWith(
            isCategoriesLoading: false,
            categoriesFailure: result.failure,
          ),
        );
        break;
    }
  }

  Future<void> _getMealsByCategory(String mealCategoryName) async {
    emit(state.copyWith(isMealsLoading: true));

    final result = await _getMealsByCategoryUseCase.invoke(
      mealCategoryName: mealCategoryName,
    );

    switch (result) {
      case ApiSuccessResult<MealsByCategoryResponseEntity>():
        emit(state.copyWith(isMealsLoading: false, mealsResponse: result.data));
        break;

      case ApiErrorResult<MealsByCategoryResponseEntity>():
        emit(
          state.copyWith(isMealsLoading: false, mealsFailure: result.failure),
        );
        break;
    }
  }
}

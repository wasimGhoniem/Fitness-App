import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/foodDetails/domain/useCases/get_food_details_use_case.dart';
import 'package:fitness_app/features/foodDetails/presentation/viewModel/food_details_event.dart';
import 'package:fitness_app/features/foodDetails/presentation/viewModel/food_details_state.dart';
import 'package:fitness_app/features/foodDetails/presentation/viewModel/food_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_details_view_model_test.mocks.dart';

@GenerateMocks([GetFoodDetailsUseCase])
void main() {
  setUpAll(() {
    provideDummy<ApiResult<MealDetailsResponseEntity>>(
      ApiSuccessResult<MealDetailsResponseEntity>(
        data: MealDetailsResponseEntity(meals: []),
      ),
    );
  });

  late MockGetFoodDetailsUseCase mockGetFoodDetailsUseCase;
  late FoodDetailsViewModel viewModel;

  setUp(() {
    mockGetFoodDetailsUseCase = MockGetFoodDetailsUseCase();
    viewModel = FoodDetailsViewModel(mockGetFoodDetailsUseCase);
  });

  tearDown(() async {
    await viewModel.close();
  });

  group('FoodDetailsViewModel', () {
    test('initial state is correct', () {
      expect(viewModel.state, const FoodDetailsState(isLoading: true));
      expect(viewModel.state.isLoading, true);
      expect(viewModel.state.failure, isNull);
      expect(viewModel.state.MealDetails, isNull);
    });

    group('LoadFoodDetailsEvent', () {
      const mealId = '52772';

      test('emits meal details on success', () async {
        // Arrange
        final mealEntity = MealEntity(
          id: mealId,
          name: 'Chicken Handi',
          category: 'Chicken',
          area: 'Indian',
          instructions: 'Test instructions',
          imageUrl: 'https://example.com/image.jpg',
          youtubeUrl: 'https://youtube.com/watch?v=test',
          ingredients: ['Chicken', 'Spices'],
          measures: ['1 kg', '2 tbsp'],
        );
        final responseEntity = MealDetailsResponseEntity(meals: [mealEntity]);

        when(mockGetFoodDetailsUseCase.invoke(mealId))
            .thenAnswer((_) async => ApiSuccessResult(data: responseEntity));

        // Act
        await viewModel.doIntent(LoadFoodDetailsEvent(mealId: mealId));

        // Assert
        expect(viewModel.state.isLoading, false);
        expect(viewModel.state.MealDetails, same(mealEntity));
        expect(viewModel.state.failure, isNull);
        verify(mockGetFoodDetailsUseCase.invoke(mealId)).called(1);
      });

      test('emits failure on error', () async {
        // Arrange
        const mealId = '52772';
        final failure = Failure(errorMessage: 'Network error');

        when(mockGetFoodDetailsUseCase.invoke(mealId))
            .thenAnswer((_) async => ApiErrorResult(failure: failure));

        // Act
        await viewModel.doIntent(LoadFoodDetailsEvent(mealId: mealId));

        // Assert
        expect(viewModel.state.isLoading, false);
        expect(viewModel.state.failure, same(failure));
        expect(viewModel.state.MealDetails, isNull);
        verify(mockGetFoodDetailsUseCase.invoke(mealId)).called(1);
      });

    });
  });
}

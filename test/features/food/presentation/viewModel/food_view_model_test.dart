import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/features/food/presentation/viewModel/food_view_model.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_event.dart';
import 'package:fitness_app/features/food/presentation/viewModel/food_state.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_categories_use_case.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_by_category_use_case.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_entity.dart';

import 'food_view_model_test.mocks.dart';

@GenerateMocks([GetMealsCategoriesUseCase, GetMealsByCategoryUseCase])
void main() {
  setUpAll(() {
    // Provide Mockito dummies for ApiResult generics if needed in unstubbed flows
    provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
      ApiSuccessResult<MealsCategoriesResponseEntity>(
        data: MealsCategoriesResponseEntity(categories: const []),
      ),
    );
    provideDummy<ApiResult<MealsByCategoryResponseEntity>>(
      ApiSuccessResult<MealsByCategoryResponseEntity>(
        data: MealsByCategoryResponseEntity(meals: const []),
      ),
    );
  });

  late MockGetMealsCategoriesUseCase mockGetMealsCategoriesUseCase;
  late MockGetMealsByCategoryUseCase mockGetMealsByCategoryUseCase;
  late FoodViewModel viewModel;

  setUp(() {
    mockGetMealsCategoriesUseCase = MockGetMealsCategoriesUseCase();
    mockGetMealsByCategoryUseCase = MockGetMealsByCategoryUseCase();
    viewModel = FoodViewModel(
      mockGetMealsCategoriesUseCase,
      mockGetMealsByCategoryUseCase,
    );
  });

  tearDown(() async {
    await viewModel.close();
  });

  group('GetAllMealCategoriesEvent', () {
    test(
      'emits categories on success and sets isCategoriesLoading=false',
      () async {
        // Arrange
        final categoriesEntity = MealsCategoriesResponseEntity(
          categories: const [],
        );
        when(
          mockGetMealsCategoriesUseCase.invoke(),
        ).thenAnswer((_) async => ApiSuccessResult(data: categoriesEntity));

        // Act
        await viewModel.doIntent(GetAllMealCategoriesEvent());

        // Assert
        expect(viewModel.state.isCategoriesLoading, false);
        expect(viewModel.state.categoriesResponse, same(categoriesEntity));
        expect(viewModel.state.categoriesFailure, isNull);
        verify(mockGetMealsCategoriesUseCase.invoke()).called(1);
      },
    );

    test('emits failure on error and sets isCategoriesLoading=false', () async {
      // Arrange
      final failure = Failure(errorMessage: 'error');
      when(
        mockGetMealsCategoriesUseCase.invoke(),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      // Act
      await viewModel.doIntent(GetAllMealCategoriesEvent());

      // Assert
      expect(viewModel.state.isCategoriesLoading, false);
      expect(viewModel.state.categoriesFailure, same(failure));
      expect(viewModel.state.categoriesResponse, isNull);
      verify(mockGetMealsCategoriesUseCase.invoke()).called(1);
    });
  });

  group('GetMealsByCategoryEvent', () {
    test('emits loading then meals on success', () async {
      // Arrange
      const category = 'Seafood';
      final mealsEntity = MealsByCategoryResponseEntity(
        meals: const [
          MealsEntity(mealName: 'Fish', mealPhoto: 'img', mealId: '1'),
        ],
      );

      when(
        mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
      ).thenAnswer((_) async => ApiSuccessResult(data: mealsEntity));

      // Capture emissions
      final states = <FoodState>[];
      final sub = viewModel.stream.listen(states.add);

      // Act
      await viewModel.doIntent(
        GetMealsByCategoryEvent(mealCategoryName: category),
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));
      await sub.cancel();

      // Assert
      expect(states.isNotEmpty, true);
      // First emission should set isMealsLoading true
      expect(states.first.isMealsLoading, true);
      // Last emission has success response and loading false
      expect(states.last.isMealsLoading, false);
      expect(states.last.mealsResponse, same(mealsEntity));
      expect(states.last.mealsFailure, isNull);
      verify(
        mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
      ).called(1);
    });

    test('emits loading then failure on error', () async {
      // Arrange
      const category = 'Seafood';
      final failure = Failure(errorMessage: 'server');

      when(
        mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      final states = <FoodState>[];
      final sub = viewModel.stream.listen(states.add);

      // Act
      await viewModel.doIntent(
        GetMealsByCategoryEvent(mealCategoryName: category),
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));
      await sub.cancel();

      // Assert
      expect(states.first.isMealsLoading, true);
      expect(states.last.isMealsLoading, false);
      expect(states.last.mealsFailure, same(failure));
      expect(states.last.mealsResponse, isNull);
      verify(
        mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
      ).called(1);
    });
  });

  group('LoadAllFoodDataEvent', () {
    test(
      'triggers both categories and meals; final state contains both on success',
      () async {
        // Arrange
        const category = 'Seafood';
        final categoriesEntity = MealsCategoriesResponseEntity(
          categories: const [],
        );
        final mealsEntity = MealsByCategoryResponseEntity(meals: const []);

        when(
          mockGetMealsCategoriesUseCase.invoke(),
        ).thenAnswer((_) async => ApiSuccessResult(data: categoriesEntity));
        when(
          mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
        ).thenAnswer((_) async => ApiSuccessResult(data: mealsEntity));

        // Act
        await viewModel.doIntent(
          LoadAllFoodDataEvent(mealCategoryName: category),
        );
        // Allow async completion
        await Future<void>.delayed(const Duration(milliseconds: 10));

        // Assert
        verify(mockGetMealsCategoriesUseCase.invoke()).called(1);
        verify(
          mockGetMealsByCategoryUseCase.invoke(mealCategoryName: category),
        ).called(1);
        expect(viewModel.state.isCategoriesLoading, false);
        expect(viewModel.state.categoriesResponse, same(categoriesEntity));
        expect(viewModel.state.isMealsLoading, false);
        expect(viewModel.state.mealsResponse, same(mealsEntity));
      },
    );
  });
}

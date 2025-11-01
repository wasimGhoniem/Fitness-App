import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/features/food/data/repositories/food_repo_impl.dart';
import 'package:fitness_app/features/food/data/dataSources/food_remote_data_source.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';

import 'food_repo_impl_test.mocks.dart';

@GenerateMocks([FoodRemoteDataSource])
void main() {
  setUpAll(() {
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

  late MockFoodRemoteDataSource mockRemoteDataSource;
  late FoodRepoImpl repo;

  setUp(() {
    mockRemoteDataSource = MockFoodRemoteDataSource();
    repo = FoodRepoImpl(mockRemoteDataSource);
  });

  group('FoodRepoImpl.getMealsCategories', () {
    test('returns ApiSuccessResult when remote succeeds', () async {
      // Arrange
      final entity = MealsCategoriesResponseEntity(categories: const []);
      when(
        mockRemoteDataSource.getMealsCategories(),
      ).thenAnswer((_) async => ApiSuccessResult(data: entity));

      // Act
      final result = await repo.getMealsCategories();

      // Assert
      expect(result, isA<ApiSuccessResult<MealsCategoriesResponseEntity>>());
      final success = result as ApiSuccessResult<MealsCategoriesResponseEntity>;
      expect(success.data, same(entity));
      verify(mockRemoteDataSource.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('returns ApiErrorResult when remote fails', () async {
      // Arrange
      final failure = Failure(errorMessage: 'net');
      when(
        mockRemoteDataSource.getMealsCategories(),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      // Act
      final result = await repo.getMealsCategories();

      // Assert
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      final error = result as ApiErrorResult<MealsCategoriesResponseEntity>;
      expect(error.failure.errorMessage, 'net');
      verify(mockRemoteDataSource.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('FoodRepoImpl.getMealsByCategory', () {
    const category = 'Seafood';

    test('returns ApiSuccessResult when remote succeeds', () async {
      // Arrange
      final entity = MealsByCategoryResponseEntity(meals: const []);
      when(
        mockRemoteDataSource.getMealsByCategory(mealCategoryName: category),
      ).thenAnswer((_) async => ApiSuccessResult(data: entity));

      // Act
      final result = await repo.getMealsByCategory(mealCategoryName: category);

      // Assert
      expect(result, isA<ApiSuccessResult<MealsByCategoryResponseEntity>>());
      final success = result as ApiSuccessResult<MealsByCategoryResponseEntity>;
      expect(success.data, same(entity));
      verify(
        mockRemoteDataSource.getMealsByCategory(mealCategoryName: category),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('returns ApiErrorResult when remote fails', () async {
      // Arrange
      final failure = Failure(errorMessage: 'server');
      when(
        mockRemoteDataSource.getMealsByCategory(mealCategoryName: category),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      // Act
      final result = await repo.getMealsByCategory(mealCategoryName: category);

      // Assert
      expect(result, isA<ApiErrorResult<MealsByCategoryResponseEntity>>());
      final error = result as ApiErrorResult<MealsByCategoryResponseEntity>;
      expect(error.failure.errorMessage, 'server');
      verify(
        mockRemoteDataSource.getMealsByCategory(mealCategoryName: category),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/foodDetails/data/dataSources/food_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/data/repositories/food_details_repository_impl.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_details_repository_impl_test.mocks.dart';

@GenerateMocks([FoodDetailsRemoteDataSource])
void main() {
  setUpAll(() {
    provideDummy<ApiResult<MealDetailsResponseEntity>>(
      ApiSuccessResult<MealDetailsResponseEntity>(
        data: MealDetailsResponseEntity(meals: []),
      ),
    );
  });

  late MockFoodDetailsRemoteDataSource mockRemoteDataSource;
  late FoodDetailsRepositoryImpl repo;

  setUp(() {
    mockRemoteDataSource = MockFoodDetailsRemoteDataSource();
    repo = FoodDetailsRepositoryImpl(mockRemoteDataSource);
  });

  group('FoodDetailsRepositoryImpl.getMealDetails', () {
    const mealId = '52772';

    test('returns ApiSuccessResult when remote succeeds', () async {
      // Arrange
      final entity = MealDetailsResponseEntity(meals: []);
      when(
        mockRemoteDataSource.getMealDetails(mealId),
      ).thenAnswer((_) async => ApiSuccessResult(data: entity));

      // Act
      final result = await repo.getMealDetails(mealId);

      // Assert
      expect(result, isA<ApiSuccessResult<MealDetailsResponseEntity>>());
      final success = result as ApiSuccessResult<MealDetailsResponseEntity>;
      expect(success.data, same(entity));
      verify(mockRemoteDataSource.getMealDetails(mealId)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('returns ApiErrorResult when remote fails', () async {
      // Arrange
      final failure = Failure(errorMessage: 'Network error');
      when(
        mockRemoteDataSource.getMealDetails(mealId),
      ).thenAnswer((_) async => ApiErrorResult(failure: failure));

      // Act
      final result = await repo.getMealDetails(mealId);

      // Assert
      expect(result, isA<ApiErrorResult<MealDetailsResponseEntity>>());
      final error = result as ApiErrorResult<MealDetailsResponseEntity>;
      expect(error.failure.errorMessage, 'Network error');
      verify(mockRemoteDataSource.getMealDetails(mealId)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}

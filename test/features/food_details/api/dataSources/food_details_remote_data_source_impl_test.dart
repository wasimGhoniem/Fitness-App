import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/foodDetails/api/client/food_details_api_service.dart';
import 'package:fitness_app/features/foodDetails/api/dataSources/food_details_remote_data_source_impl.dart';
import 'package:fitness_app/features/foodDetails/api/model/meal_details_response_dto.dart';
import 'package:fitness_app/features/foodDetails/api/model/meal_dto.dart';
import 'package:fitness_app/features/foodDetails/data/dataSources/food_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/domain/entities/meal_details_response_entity.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_details_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([FoodDetailsApiService, ApiRemoteExecutor])
void main() {
  setUpAll(() {
    provideDummy<ApiResult<dynamic>>(ApiSuccessResult<dynamic>(data: null));
    provideDummy<ApiResult<Object?>>(ApiSuccessResult<Object?>(data: null));
    provideDummy<ApiResult<MealDetailsResponseEntity>>(
      ApiSuccessResult<MealDetailsResponseEntity>(
        data: MealDetailsResponseEntity(meals: []),
      ),
    );
  });

  late MockFoodDetailsApiService mockApiService;
  late MockApiRemoteExecutor mockApiRemoteExecutor;
  late FoodDetailsRemoteDataSource dataSource;

  setUp(() {
    mockApiService = MockFoodDetailsApiService();
    mockApiRemoteExecutor = MockApiRemoteExecutor();
    dataSource = FoodDetailsRemoteDataSourceImpl(
      mockApiService,
      mockApiRemoteExecutor,
    );
  });

  group('FoodDetailsRemoteDataSourceImpl - getMealDetails', () {
    const mealId = '52772';

    test('returns ApiSuccessResult with mapped entity on success', () async {
      // Arrange
      final dto = MealDetailsResponseDto(
        meals: [
          MealDto(
            idMeal: mealId,
            strMeal: 'Chicken Handi',
            strCategory: 'Chicken',
            strArea: 'Indian',
            strInstructions: 'Test instructions',
            strMealThumb: 'https://example.com/image.jpg',
            strYoutube: 'https://youtube.com/watch?v=test',
            strIngredient1: 'Chicken',
            strMeasure1: '1 kg',
            strTags: 'test',
            strSource: 'https://example.com',
          ),
        ],
      );

      when(mockApiService.getMealDetails(mealId)).thenAnswer((_) async => dto);

      when(
        mockApiRemoteExecutor
            .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((invocation) async {
        final request =
            invocation.namedArguments[#request]
                as Future<MealDetailsResponseDto> Function();
        final mapper =
            invocation.namedArguments[#mapper]
                as MealDetailsResponseEntity Function(MealDetailsResponseDto);
        final fetched = await request();
        final mapped = mapper(fetched);
        return ApiSuccessResult<MealDetailsResponseEntity>(data: mapped);
      });

      // Act
      final result = await dataSource.getMealDetails(mealId);

      // Assert
      expect(result, isA<ApiSuccessResult<MealDetailsResponseEntity>>());
      final success = result as ApiSuccessResult<MealDetailsResponseEntity>;
      expect(success.data.meals, isNotEmpty);
      expect(success.data.meals?.first.id, mealId);
      expect(success.data.meals?.first.name, 'Chicken Handi');
      verify(
        mockApiRemoteExecutor
            .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).called(1);
      verify(mockApiService.getMealDetails(mealId)).called(1);
      verifyNoMoreInteractions(mockApiService);
    });

    test('returns ApiErrorResult on executor error', () async {
      // Arrange
      final failure = Failure(errorMessage: 'Network error');
      when(
        mockApiRemoteExecutor
            .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer(
        (_) async =>
            ApiErrorResult<MealDetailsResponseEntity>(failure: failure),
      );

      // Act
      final result = await dataSource.getMealDetails(mealId);

      // Assert
      expect(result, isA<ApiErrorResult<MealDetailsResponseEntity>>());
      final error = result as ApiErrorResult<MealDetailsResponseEntity>;
      expect(error.failure.errorMessage, 'Network error');
      verify(
        mockApiRemoteExecutor
            .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).called(1);
    });

    test('handles empty meals list correctly', () async {
      // Arrange
      final dto = MealDetailsResponseDto(meals: []);

      when(mockApiService.getMealDetails(mealId)).thenAnswer((_) async => dto);

      when(
        mockApiRemoteExecutor
            .execute<MealDetailsResponseDto, MealDetailsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((invocation) async {
        final request =
            invocation.namedArguments[#request]
                as Future<MealDetailsResponseDto> Function();
        final mapper =
            invocation.namedArguments[#mapper]
                as MealDetailsResponseEntity Function(MealDetailsResponseDto);
        final fetched = await request();
        final mapped = mapper(fetched);
        return ApiSuccessResult<MealDetailsResponseEntity>(data: mapped);
      });

      // Act
      final result = await dataSource.getMealDetails(mealId);

      // Assert
      expect(result, isA<ApiSuccessResult<MealDetailsResponseEntity>>());
      final success = result as ApiSuccessResult<MealDetailsResponseEntity>;
      expect(success.data.meals, isEmpty);
    });
  });
}

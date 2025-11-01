import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/features/food/api/client/food_api_service.dart';
import 'package:fitness_app/features/food/api/dataSources/food_remote_data_source_impl.dart';
import 'package:fitness_app/features/food/api/model/meals_categories_response_dto.dart';
import 'package:fitness_app/features/food/api/model/meal_category_dto.dart';
import 'package:fitness_app/features/food/api/model/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/food/api/model/meals_dto.dart';
import 'package:fitness_app/features/food/data/dataSources/food_remote_data_source.dart';
import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meals_by_category_response_entity.dart';

import 'food_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([FoodApiService, ApiRemoteExecutor])
void main() {
  setUpAll(() {
    // Provide dummies required by Mockito for generic return types
    provideDummy<ApiResult<dynamic>>(ApiSuccessResult<dynamic>(data: null));
    provideDummy<ApiResult<Object?>>(ApiSuccessResult<Object?>(data: null));
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

  late MockFoodApiService mockApiService;
  late MockApiRemoteExecutor mockApiRemoteExecutor;
  late FoodRemoteDataSource dataSource;

  setUp(() {
    mockApiService = MockFoodApiService();
    mockApiRemoteExecutor = MockApiRemoteExecutor();
    dataSource = FoodRemoteDataSourceImpl(
      mockApiService,
      mockApiRemoteExecutor,
    );
  });

  group('FoodRemoteDataSourceImpl - getMealsCategories', () {
    test('returns ApiSuccessResult with mapped entity on success', () async {
      // Arrange
      final dto = MealsCategoriesResponseDto(
        categories: [
          MealCategoryDto(
            idCategory: '1',
            strCategory: 'Seafood',
            strCategoryThumb: 'thumb',
            strCategoryDescription: 'desc',
          ),
        ],
      );

      when(mockApiService.getMealsCategories()).thenAnswer((_) async => dto);

      when(
        mockApiRemoteExecutor
            .execute<MealsCategoriesResponseDto, MealsCategoriesResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((invocation) async {
        final request =
            invocation.namedArguments[#request]
                as Future<MealsCategoriesResponseDto> Function();
        final mapper =
            invocation.namedArguments[#mapper]
                as MealsCategoriesResponseEntity Function(
                  MealsCategoriesResponseDto,
                );
        final fetched = await request();
        final mapped = mapper(fetched);
        return ApiSuccessResult<MealsCategoriesResponseEntity>(data: mapped);
      });

      // Act
      final result = await dataSource.getMealsCategories();

      // Assert
      expect(result, isA<ApiSuccessResult<MealsCategoriesResponseEntity>>());
      verify(
        mockApiRemoteExecutor
            .execute<MealsCategoriesResponseDto, MealsCategoriesResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).called(1);
      verify(mockApiService.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockApiService);
    });

    test('returns ApiErrorResult on executor error', () async {
      // Arrange
      final failure = Failure(errorMessage: 'network');
      when(
        mockApiRemoteExecutor
            .execute<MealsCategoriesResponseDto, MealsCategoriesResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer(
        (_) async =>
            ApiErrorResult<MealsCategoriesResponseEntity>(failure: failure),
      );

      // Act
      final result = await dataSource.getMealsCategories();

      // Assert
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      final error = result as ApiErrorResult<MealsCategoriesResponseEntity>;
      expect(error.failure.errorMessage, 'network');
    });
  });

  group('FoodRemoteDataSourceImpl - getMealsByCategory', () {
    const category = 'Seafood';

    test('returns ApiSuccessResult with mapped entity on success', () async {
      // Arrange
      final dto = MealsByCategoryResponseDto(
        meals: [
          MealsDto(idMeal: '100', strMeal: 'Fish Curry', strMealThumb: 'img'),
        ],
      );

      when(
        mockApiService.getMealsByCategory(category),
      ).thenAnswer((_) async => dto);

      when(
        mockApiRemoteExecutor
            .execute<MealsByCategoryResponseDto, MealsByCategoryResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((invocation) async {
        final request =
            invocation.namedArguments[#request]
                as Future<MealsByCategoryResponseDto> Function();
        final mapper =
            invocation.namedArguments[#mapper]
                as MealsByCategoryResponseEntity Function(
                  MealsByCategoryResponseDto,
                );
        final fetched = await request();
        final mapped = mapper(fetched);
        return ApiSuccessResult<MealsByCategoryResponseEntity>(data: mapped);
      });

      // Act
      final result = await dataSource.getMealsByCategory(
        mealCategoryName: category,
      );

      // Assert
      expect(result, isA<ApiSuccessResult<MealsByCategoryResponseEntity>>());
      verify(
        mockApiRemoteExecutor
            .execute<MealsByCategoryResponseDto, MealsByCategoryResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).called(1);
      verify(mockApiService.getMealsByCategory(category)).called(1);
      verifyNoMoreInteractions(mockApiService);
    });

    test('returns ApiErrorResult on executor error', () async {
      // Arrange
      final failure = Failure(errorMessage: 'server');
      when(
        mockApiRemoteExecutor
            .execute<MealsByCategoryResponseDto, MealsByCategoryResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer(
        (_) async =>
            ApiErrorResult<MealsByCategoryResponseEntity>(failure: failure),
      );

      // Act
      final result = await dataSource.getMealsByCategory(
        mealCategoryName: category,
      );

      // Assert
      expect(result, isA<ApiErrorResult<MealsByCategoryResponseEntity>>());
      final error = result as ApiErrorResult<MealsByCategoryResponseEntity>;
      expect(error.failure.errorMessage, 'server');
    });
  });
}

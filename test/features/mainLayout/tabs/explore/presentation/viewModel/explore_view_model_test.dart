import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_categories_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_by_group_id_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_groups_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_profile_data_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_random_muscles_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_event.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<GetRandomMusclesUseCase>(),
  MockSpec<GetMusclesGroupsUseCase>(),
  MockSpec<GetMusclesByGroupIdUseCase>(),
  MockSpec<GetProfileDataUseCase>(),
  MockSpec<GetMealsCategoriesUseCase>(),
])
import 'explore_view_model_test.mocks.dart';

void provideDummyApiResults() {
  provideDummy<ApiResult<MuscleResponseEntity>>(
    ApiSuccessResult(
      data: MuscleResponseEntity(message: '', totalMuscles: 0, muscles: []),
    ),
  );
  provideDummy<ApiResult<MusclesGroupsResponseEntity>>(
    ApiSuccessResult(
      data: MusclesGroupsResponseEntity(message: '', musclesGroup: []),
    ),
  );
  provideDummy<ApiResult<MuscleGroupDetailsResponseEntity>>(
    ApiSuccessResult(
      data: MuscleGroupDetailsResponseEntity(
        message: '',
        muscleGroup: const MuscleGroupEntity(id: '', name: ''),
        muscles: [],
      ),
    ),
  );
  provideDummy<ApiResult<ProfileDataResponseEntity>>(
    ApiSuccessResult(
      data: ProfileDataResponseEntity(
        message: '',
        profile: const ProfileEntity(id: '', name: '', email: '', avatar: ''),
      ),
    ),
  );
  provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
    ApiSuccessResult(
      data: const MealsCategoriesResponseEntity(categories: []), // <-- fix here
    ),
  );
}

void main() {
  provideDummyApiResults();
  late MockGetRandomMusclesUseCase mockGetRandomMusclesUseCase;
  late MockGetMusclesGroupsUseCase mockGetMusclesGroupsUseCase;
  late MockGetMusclesByGroupIdUseCase mockGetMusclesByGroupIdUseCase;
  late MockGetProfileDataUseCase mockGetProfileDataUseCase;
  late MockGetMealsCategoriesUseCase mockGetMealsCategoriesUseCase;
  late ExploreViewModel viewModel;

  setUp(() {
    mockGetRandomMusclesUseCase = MockGetRandomMusclesUseCase();
    mockGetMusclesGroupsUseCase = MockGetMusclesGroupsUseCase();
    mockGetMusclesByGroupIdUseCase = MockGetMusclesByGroupIdUseCase();
    mockGetProfileDataUseCase = MockGetProfileDataUseCase();
    mockGetMealsCategoriesUseCase = MockGetMealsCategoriesUseCase();
    viewModel = ExploreViewModel(
      mockGetMusclesByGroupIdUseCase,
      mockGetProfileDataUseCase,
      mockGetRandomMusclesUseCase,
      mockGetMusclesGroupsUseCase,
      mockGetMealsCategoriesUseCase,
    );
  });

  group('ExploreViewModel', () {
    blocTest<ExploreViewModel, ExploreState>(
      'emits correct state for _getRandomMuscles success',
      build: () {
        when(mockGetRandomMusclesUseCase.call()).thenAnswer(
          (_) async => ApiSuccessResult(
            data: MuscleResponseEntity(
              message: 'ok',
              totalMuscles: 1,
              muscles: [],
            ),
          ),
        );
        return viewModel;
      },
      act: (bloc) =>
          bloc.doIntent(GetAllExploreEvent(id: '1')), // <-- remove const
      expect: () => contains(
        predicate<ExploreState>((state) => state.muscleResponseEntity != null),
      ),
    );

    blocTest<ExploreViewModel, ExploreState>(
      'emits correct state for _getMusclesGroups success',
      build: () {
        when(mockGetMusclesGroupsUseCase.call()).thenAnswer(
          (_) async => ApiSuccessResult(
            data: MusclesGroupsResponseEntity(message: 'ok', musclesGroup: []),
          ),
        );
        return viewModel;
      },
      act: (bloc) =>
          bloc.doIntent(GetAllExploreEvent(id: '1')), // <-- remove const
      expect: () => contains(
        predicate<ExploreState>(
          (state) => state.musclesGroupsResponseEntity != null,
        ),
      ),
    );

    blocTest<ExploreViewModel, ExploreState>(
      'emits correct state for _getMusclesByGroupId success',
      build: () {
        when(
          mockGetMusclesByGroupIdUseCase.call(groupId: anyNamed('groupId')),
        ).thenAnswer(
          (_) async => ApiSuccessResult(
            data: MuscleGroupDetailsResponseEntity(
              message: 'ok',
              muscleGroup: const MuscleGroupEntity(id: '1', name: 'group'),
              muscles: [],
            ),
          ),
        );
        return viewModel;
      },
      act: (bloc) =>
          bloc.doIntent(GetMusclesByGroupIdEvent(id: '1')), // <-- remove const
      expect: () => contains(
        predicate<ExploreState>(
          (state) => state.muscleGroupDetailsResponseEntity != null,
        ),
      ),
    );

    blocTest<ExploreViewModel, ExploreState>(
      'emits correct state for _getProfileData success',
      build: () {
        when(mockGetProfileDataUseCase.call()).thenAnswer(
          (_) async => ApiSuccessResult(
            data: ProfileDataResponseEntity(
              message: 'ok',
              profile: const ProfileEntity(
                id: '1',
                name: 'n',
                email: 'e',
                avatar: 'a',
              ),
            ),
          ),
        );
        return viewModel;
      },
      act: (bloc) =>
          bloc.doIntent(GetAllExploreEvent(id: '1')), // <-- remove const
      expect: () => contains(
        predicate<ExploreState>(
          (state) => state.profileDataResponseEntity != null,
        ),
      ),
    );

    blocTest<ExploreViewModel, ExploreState>(
      'emits correct state for _getAllMealCategories success',
      build: () {
        when(mockGetMealsCategoriesUseCase.invoke()).thenAnswer(
          (_) async => ApiSuccessResult(
            data: const MealsCategoriesResponseEntity(
              categories: [],
            ), // <-- fix here
          ),
        );
        return viewModel;
      },
      act: (bloc) =>
          bloc.doIntent(GetAllExploreEvent(id: '1')), // <-- remove const
      expect: () => contains(
        predicate<ExploreState>((state) => state.categoriesResponse != null),
      ),
    );
  });
}

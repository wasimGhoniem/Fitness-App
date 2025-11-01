import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/client/explore_api_service.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/dataSources/explore_remote_data_source_impl.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_details_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_groups_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_data_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreApiService>(), MockSpec<RemoteExecutor>()])
import 'explore_remote_data_source_impl_test.mocks.dart';

void provideDummyApiResult() {
  final dummyFailure = ServerFailure(errorMessage: 'test error');
  provideDummy<ApiResult<dynamic>>(
    ApiErrorResult<dynamic>(failure: dummyFailure),
  );
  provideDummy<ApiResult<MuscleResponseEntity>>(
    ApiErrorResult<MuscleResponseEntity>(failure: dummyFailure),
  );
  provideDummy<ApiResult<MusclesGroupsResponseEntity>>(
    ApiErrorResult<MusclesGroupsResponseEntity>(failure: dummyFailure),
  );
  provideDummy<ApiResult<MuscleGroupDetailsResponseEntity>>(
    ApiErrorResult<MuscleGroupDetailsResponseEntity>(failure: dummyFailure),
  );
  provideDummy<ApiResult<ProfileDataResponseEntity>>(
    ApiErrorResult<ProfileDataResponseEntity>(failure: dummyFailure),
  );
}

void main() {
  provideDummyApiResult();
  late MockExploreApiService mockApiService;
  late MockRemoteExecutor mockRemoteExecutor;
  late ExploreRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiService = MockExploreApiService();
    mockRemoteExecutor = MockRemoteExecutor();
    dataSource = ExploreRemoteDataSourceImpl(
      mockApiService,
      mockRemoteExecutor,
    );
  });

  group('getRandomMuscles', () {
    test('returns ApiSuccessResult on success', () async {
      final dummyDto = MusclesResponseDto(
        message: 'ok',
        totalMuscles: 1,
        muscles: [],
      );
      final dummyEntity = MuscleResponseEntity(
        message: 'ok',
        totalMuscles: 1,
        muscles: [],
      );
      when(mockApiService.getRandomMuscles()).thenAnswer((_) async => dummyDto);
      when(
        mockRemoteExecutor.execute<MusclesResponseDto, MuscleResponseEntity>(
          request: anyNamed('request'),
          mapper: anyNamed('mapper'),
        ),
      ).thenAnswer((_) async => ApiSuccessResult(data: dummyEntity));
      final result = await dataSource.getRandomMuscles();
      expect(result, isA<ApiSuccessResult<MuscleResponseEntity>>());
    });
    test('returns ApiErrorResult on error', () async {
      when(
        mockApiService.getRandomMuscles(),
      ).thenThrow(ServerFailure(errorMessage: 'fail'));
      final result = await dataSource.getRandomMuscles();
      expect(result, isA<ApiErrorResult<MuscleResponseEntity>>());
    });
  });

  group('getMusclesGroups', () {
    test('returns ApiSuccessResult on success', () async {
      final dummyDto = MusclesGroupsResponseDto(
        message: 'ok',
        musclesGroup: [],
      );
      final dummyEntity = MusclesGroupsResponseEntity(
        message: 'ok',
        musclesGroup: [],
      );
      when(mockApiService.getMusclesGroups()).thenAnswer((_) async => dummyDto);
      when(
        mockRemoteExecutor
            .execute<MusclesGroupsResponseDto, MusclesGroupsResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((_) async => ApiSuccessResult(data: dummyEntity));
      final result = await dataSource.getMusclesGroups();
      expect(result, isA<ApiSuccessResult<MusclesGroupsResponseEntity>>());
    });
    test('returns ApiErrorResult on error', () async {
      when(
        mockApiService.getMusclesGroups(),
      ).thenThrow(ServerFailure(errorMessage: 'fail'));
      final result = await dataSource.getMusclesGroups();
      expect(result, isA<ApiErrorResult<MusclesGroupsResponseEntity>>());
    });
  });

  group('getMusclesByGroupId', () {
    test('returns ApiSuccessResult on success', () async {
      final dummyMuscleGroup = const MuscleGroupEntity(id: '1', name: 'group');
      final dummyDto = MuscleGroupDetailsResponseDto(
        message: 'ok',
        muscleGroup: null,
        muscles: [],
      );
      final dummyEntity = MuscleGroupDetailsResponseEntity(
        message: 'ok',
        muscleGroup: dummyMuscleGroup,
        muscles: [],
      );
      when(
        mockApiService.getMusclesByGroupId(any),
      ).thenAnswer((_) async => dummyDto);
      when(
        mockRemoteExecutor.execute<
          MuscleGroupDetailsResponseDto,
          MuscleGroupDetailsResponseEntity
        >(request: anyNamed('request'), mapper: anyNamed('mapper')),
      ).thenAnswer((_) async => ApiSuccessResult(data: dummyEntity));
      final result = await dataSource.getMusclesByGroupId('1');
      expect(result, isA<ApiSuccessResult<MuscleGroupDetailsResponseEntity>>());
    });
    test('returns ApiErrorResult on error', () async {
      when(
        mockApiService.getMusclesByGroupId(any),
      ).thenThrow(ServerFailure(errorMessage: 'fail'));
      final result = await dataSource.getMusclesByGroupId('1');
      expect(result, isA<ApiErrorResult<MuscleGroupDetailsResponseEntity>>());
    });
  });

  group('getProfileData', () {
    test('returns ApiSuccessResult on success', () async {
      final dummyProfile = const ProfileEntity(
        id: '1',
        name: 'n',
        email: 'e',
        avatar: 'a',
      );
      final dummyDto = ProfileDataResponseDto(message: 'ok', profile: null);
      final dummyEntity = ProfileDataResponseEntity(
        message: 'ok',
        profile: dummyProfile,
      );
      when(mockApiService.getProfileData()).thenAnswer((_) async => dummyDto);
      when(
        mockRemoteExecutor
            .execute<ProfileDataResponseDto, ProfileDataResponseEntity>(
              request: anyNamed('request'),
              mapper: anyNamed('mapper'),
            ),
      ).thenAnswer((_) async => ApiSuccessResult(data: dummyEntity));
      final result = await dataSource.getProfileData();
      expect(result, isA<ApiSuccessResult<ProfileDataResponseEntity>>());
    });
    test('returns ApiErrorResult on error', () async {
      when(
        mockApiService.getProfileData(),
      ).thenThrow(ServerFailure(errorMessage: 'fail'));
      final result = await dataSource.getProfileData();
      expect(result, isA<ApiErrorResult<ProfileDataResponseEntity>>());
    });
  });
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/data/dataSources/explore_remote_data_source.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/data/repositories/explore_repo_impl.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreRemoteDataSource>()])
import 'explore_repo_impl_test.mocks.dart';

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
}

void main() {
  provideDummyApiResults();
  late MockExploreRemoteDataSource mockRemoteDataSource;
  late ExploreRepoImpl repo;

  setUp(() {
    mockRemoteDataSource = MockExploreRemoteDataSource();
    repo = ExploreRepoImpl(mockRemoteDataSource);
  });

  group('getRandomMuscles', () {
    test('returns result from remote data source', () async {
      final dummyResult = ApiSuccessResult<MuscleResponseEntity>(
        data: MuscleResponseEntity(message: 'ok', totalMuscles: 1, muscles: []),
      );
      when(
        mockRemoteDataSource.getRandomMuscles(),
      ).thenAnswer((_) async => dummyResult);
      final result = await repo.getRandomMuscles();
      expect(result, dummyResult);
      verify(mockRemoteDataSource.getRandomMuscles()).called(1);
    });
  });

  group('getMusclesGroups', () {
    test('returns result from remote data source', () async {
      final dummyResult = ApiSuccessResult<MusclesGroupsResponseEntity>(
        data: MusclesGroupsResponseEntity(message: 'ok', musclesGroup: []),
      );
      when(
        mockRemoteDataSource.getMusclesGroups(),
      ).thenAnswer((_) async => dummyResult);
      final result = await repo.getMusclesGroups();
      expect(result, dummyResult);
      verify(mockRemoteDataSource.getMusclesGroups()).called(1);
    });
  });

  group('getMusclesByGroupId', () {
    test('returns result from remote data source', () async {
      final dummyMuscleGroup = const MuscleGroupEntity(id: '1', name: 'group');
      final dummyResult = ApiSuccessResult<MuscleGroupDetailsResponseEntity>(
        data: MuscleGroupDetailsResponseEntity(
          message: 'ok',
          muscleGroup: dummyMuscleGroup,
          muscles: [],
        ),
      );
      when(
        mockRemoteDataSource.getMusclesByGroupId(any),
      ).thenAnswer((_) async => dummyResult);
      final result = await repo.getMusclesByGroupId('1');
      expect(result, dummyResult);
      verify(mockRemoteDataSource.getMusclesByGroupId('1')).called(1);
    });
  });

  group('getProfileData', () {
    test('returns result from remote data source', () async {
      final dummyProfile = const ProfileEntity(
        id: '1',
        name: 'n',
        email: 'e',
        avatar: 'a',
      );
      final dummyResult = ApiSuccessResult<ProfileDataResponseEntity>(
        data: ProfileDataResponseEntity(message: 'ok', profile: dummyProfile),
      );
      when(
        mockRemoteDataSource.getProfileData(),
      ).thenAnswer((_) async => dummyResult);
      final result = await repo.getProfileData();
      expect(result, dummyResult);
      verify(mockRemoteDataSource.getProfileData()).called(1);
    });
  });
}

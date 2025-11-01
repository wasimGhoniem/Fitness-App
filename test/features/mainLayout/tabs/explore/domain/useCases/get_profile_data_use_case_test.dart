import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_profile_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreRepo>()])
import 'get_profile_data_use_case_test.mocks.dart';

void provideDummyApiResults() {
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
  late MockExploreRepo mockRepo;
  late GetProfileDataUseCase useCase;

  setUp(() {
    mockRepo = MockExploreRepo();
    useCase = GetProfileDataUseCase(mockRepo);
  });

  test('calls repo and returns result', () async {
    final dummyProfile = const ProfileEntity(
      id: '1',
      name: 'n',
      email: 'e',
      avatar: 'a',
    );
    final dummyResult = ApiSuccessResult<ProfileDataResponseEntity>(
      data: ProfileDataResponseEntity(message: 'ok', profile: dummyProfile),
    );
    when(mockRepo.getProfileData()).thenAnswer((_) async => dummyResult);
    final result = await useCase();
    expect(result, dummyResult);
    verify(mockRepo.getProfileData()).called(1);
  });
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_by_group_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreRepo>()])
import 'get_muscles_by_group_id_use_case_test.mocks.dart';

void provideDummyApiResults() {
  provideDummy<ApiResult<MuscleGroupDetailsResponseEntity>>(
    ApiSuccessResult(
      data: MuscleGroupDetailsResponseEntity(
        message: '',
        muscleGroup: const MuscleGroupEntity(id: '', name: ''),
        muscles: [],
      ),
    ),
  );
}

void main() {
  provideDummyApiResults();
  late MockExploreRepo mockRepo;
  late GetMusclesByGroupIdUseCase useCase;

  setUp(() {
    mockRepo = MockExploreRepo();
    useCase = GetMusclesByGroupIdUseCase(mockRepo);
  });

  test('calls repo with correct groupId and returns result', () async {
    final dummyResult = ApiSuccessResult<MuscleGroupDetailsResponseEntity>(
      data: MuscleGroupDetailsResponseEntity(
        message: 'ok',
        muscleGroup: const MuscleGroupEntity(id: '1', name: 'group'),
        muscles: [],
      ),
    );
    when(
      mockRepo.getMusclesByGroupId('1'),
    ).thenAnswer((_) async => dummyResult);
    final result = await useCase(groupId: '1');
    expect(result, dummyResult);
    verify(mockRepo.getMusclesByGroupId('1')).called(1);
  });
}

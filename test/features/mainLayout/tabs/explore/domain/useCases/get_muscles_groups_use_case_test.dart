import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_groups_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreRepo>()])
import 'get_muscles_groups_use_case_test.mocks.dart';

void provideDummyApiResults() {
  provideDummy<ApiResult<MusclesGroupsResponseEntity>>(
    ApiSuccessResult(
      data: MusclesGroupsResponseEntity(message: '', musclesGroup: []),
    ),
  );
}

void main() {
  provideDummyApiResults();
  late MockExploreRepo mockRepo;
  late GetMusclesGroupsUseCase useCase;

  setUp(() {
    mockRepo = MockExploreRepo();
    useCase = GetMusclesGroupsUseCase(mockRepo);
  });

  test('calls repo and returns result', () async {
    final dummyResult = ApiSuccessResult<MusclesGroupsResponseEntity>(
      data: MusclesGroupsResponseEntity(message: 'ok', musclesGroup: []),
    );
    when(mockRepo.getMusclesGroups()).thenAnswer((_) async => dummyResult);
    final result = await useCase();
    expect(result, dummyResult);
    verify(mockRepo.getMusclesGroups()).called(1);
  });
}

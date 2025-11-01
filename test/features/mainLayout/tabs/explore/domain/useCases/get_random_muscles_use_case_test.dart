import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_random_muscles_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExploreRepo>()])
import 'get_random_muscles_use_case_test.mocks.dart';

void provideDummyApiResults() {
  provideDummy<ApiResult<MuscleResponseEntity>>(
    ApiSuccessResult(
      data: MuscleResponseEntity(message: '', totalMuscles: 0, muscles: []),
    ),
  );
}

void main() {
  provideDummyApiResults();
  late MockExploreRepo mockRepo;
  late GetRandomMusclesUseCase useCase;

  setUp(() {
    mockRepo = MockExploreRepo();
    useCase = GetRandomMusclesUseCase(mockRepo);
  });

  test('calls repo and returns result', () async {
    final dummyResult = ApiSuccessResult<MuscleResponseEntity>(
      data: MuscleResponseEntity(message: 'ok', totalMuscles: 1, muscles: []),
    );
    when(mockRepo.getRandomMuscles()).thenAnswer((_) async => dummyResult);
    final result = await useCase();
    expect(result, dummyResult);
    verify(mockRepo.getRandomMuscles()).called(1);
  });
}

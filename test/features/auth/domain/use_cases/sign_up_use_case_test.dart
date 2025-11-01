import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo mockAuthRepo;
  late SignUpUseCase useCase;

  // Provide a dummy implementation for ApiResult<void> to prevent MissingDummyValueError
  provideDummy<ApiResult<void>>(ApiSuccessResult<void>(data: null));

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    useCase = SignUpUseCase(mockAuthRepo);
  });

  final tSignUpReqModel = SignUpReqModel(
    email: 'test@test.com',
    password: 'password',
    firstName: 'Test',
    lastName: 'User',
    rePassword: 'password',
    gender: 'male',
    height: 180,
    weight: 75,
    age: 30,
    goal: 'muscle',
    activityLevel: 'active',
  );

  test('should call signUp on the repository and return the result', () async {
    // Arrange
    when(
      mockAuthRepo.signUp(any),
    ).thenAnswer((_) async => ApiSuccessResult<void>(data: null));

    // Act
    final result = await useCase.invoke(signUpReqModel: tSignUpReqModel);

    // Assert
    expect(result, isA<ApiSuccessResult<void>>());
    verify(mockAuthRepo.signUp(tSignUpReqModel));
    verifyNoMoreInteractions(mockAuthRepo);
  });

  test('should return a failure when the repository call fails', () async {
    // Arrange
    final tFailure = Failure(errorMessage: 'Sign up failed');
    when(
      mockAuthRepo.signUp(any),
    ).thenAnswer((_) async => ApiErrorResult<void>(failure: tFailure));

    // Act
    final result = await useCase.invoke(signUpReqModel: tSignUpReqModel);

    // Assert
    expect(result, isA<ApiErrorResult<void>>());
    expect((result as ApiErrorResult).failure, tFailure);
    verify(mockAuthRepo.signUp(tSignUpReqModel));
    verifyNoMoreInteractions(mockAuthRepo);
  });
}

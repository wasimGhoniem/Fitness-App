import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepoImpl repository;

  // Provide a dummy implementation for ApiResult<void> to prevent MissingDummyValueError
  provideDummy<ApiResult<void>>(ApiSuccessResult<void>(data: null));

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    repository = AuthRepoImpl(
      mockAuthRemoteDataSource,
      mockAuthLocalDataSource,
    );
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

  group('signUp', () {
    test(
      'should return ApiSuccessResult when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockAuthRemoteDataSource.signUp(any),
        ).thenAnswer((_) async => ApiSuccessResult<void>(data: null));

        // Act
        final result = await repository.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiSuccessResult<void>>());
        verify(mockAuthRemoteDataSource.signUp(tSignUpReqModel));
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      },
    );

    test(
      'should return ApiErrorResult when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        final tFailure = Failure(errorMessage: 'Server Error');
        when(
          mockAuthRemoteDataSource.signUp(any),
        ).thenAnswer((_) async => ApiErrorResult<void>(failure: tFailure));

        // Act
        final result = await repository.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiErrorResult<void>>());
        expect((result as ApiErrorResult).failure, tFailure);
        verify(mockAuthRemoteDataSource.signUp(tSignUpReqModel));
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      },
    );
  });
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late AuthRepoImpl authRepoImpl;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;

  // Provide dummy values to avoid MissingDummyValueError
  provideDummy<ApiResult<void>>(ApiSuccessResult<void>(data: null));
  provideDummy<ApiResult<SignInResponseEntity>>(
    ApiSuccessResult(data: SignInResponseEntity()),
  );

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepoImpl = AuthRepoImpl(
      mockAuthRemoteDataSource,
      mockAuthLocalDataSource,
    );
  });

  group('AuthRepoImpl', () {
    // ---------------- SIGN IN TESTS ----------------
    group('signIn', () {
      test(
        'should return ApiSuccessResult when sign in is successful',
        () async {
          const email = 'test@example.com';
          const password = 'password123';
          final requestEntity = SignInRequestEntity(
            email: email,
            password: password,
          );

          final expectedEntity = SignInResponseEntity(
            message: 'Login successful',
            token: 'jwt_token_123',
            user: const SignInUserEntity(
              id: '1',
              firstName: 'John',
              lastName: 'Doe',
              email: email,
              gender: 'male',
              age: 25,
              weight: 70,
              height: 175,
              activityLevel: 'moderate',
              goal: 'lose_weight',
              photo: 'photo_url',
              createdAt: '2023-01-01',
            ),
          );

          when(
            mockAuthRemoteDataSource.signIn(request: anyNamed('request')),
          ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

          final result = await authRepoImpl.signIn(request: requestEntity);

          expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
          expect(
            (result as ApiSuccessResult).data.message,
            equals('Login successful'),
          );
          expect(
            result.data.token,
            equals('jwt_token_123'),
          );
          expect(result.data.user?.firstName, equals('John'));

          verify(
            mockAuthRemoteDataSource.signIn(request: requestEntity),
          ).called(1);
        },
      );

      test('should return ApiErrorResult when sign in fails', () async {
        const email = 'test@example.com';
        const password = 'wrong_password';
        final requestEntity = SignInRequestEntity(
          email: email,
          password: password,
        );

        final expectedEntity = SignInResponseEntity(
          message: 'Invalid credentials',
          token: '',
          user: const SignInUserEntity(),
        );

        when(
          mockAuthRemoteDataSource.signIn(request: anyNamed('request')),
        ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        final result = await authRepoImpl.signIn(request: requestEntity);

        expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
        expect(
          (result as ApiSuccessResult).data.message,
          equals('Invalid credentials'),
        );
        expect(result.data.token, equals(''));

        verify(
          mockAuthRemoteDataSource.signIn(request: requestEntity),
        ).called(1);
      });
    });

    // ---------------- SIGN UP TESTS ----------------
    group('signUp', () {
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

      test(
        'should return ApiSuccessResult when the call to remote data source is successful',
        () async {
          when(
            mockAuthRemoteDataSource.signUp(any),
          ).thenAnswer((_) async => ApiSuccessResult<void>(data: null));

          final result = await authRepoImpl.signUp(tSignUpReqModel);

          expect(result, isA<ApiSuccessResult<void>>());
          verify(mockAuthRemoteDataSource.signUp(tSignUpReqModel));
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );

      test(
        'should return ApiErrorResult when the call to remote data source is unsuccessful',
        () async {
          final tFailure = Failure(errorMessage: 'Server Error');
          when(
            mockAuthRemoteDataSource.signUp(any),
          ).thenAnswer((_) async => ApiErrorResult<void>(failure: tFailure));

          final result = await authRepoImpl.signUp(tSignUpReqModel);

          expect(result, isA<ApiErrorResult<void>>());
          expect((result as ApiErrorResult).failure, tFailure);
          verify(mockAuthRemoteDataSource.signUp(tSignUpReqModel));
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );
    });
  });
}

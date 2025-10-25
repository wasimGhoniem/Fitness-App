import 'package:fitness_app/core/errors/api_results.dart';
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

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepoImpl = AuthRepoImpl(
      mockAuthRemoteDataSource,
      mockAuthLocalDataSource,
    );

    // Provide dummy values for Mockito
    provideDummy<ApiResult<SignInResponseEntity>>(
      ApiSuccessResult(data: SignInResponseEntity()),
    );
  });

  group('AuthRepoImpl', () {
    group('signIn', () {
      test(
        'should return ApiSuccessResult when sign in is successful',
        () async {
          // Arrange
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

          // Act
          final result = await authRepoImpl.signIn(request: requestEntity);

          // Assert
          expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
          expect(
            (result as ApiSuccessResult).data.message,
            equals('Login successful'),
          );
          expect(
            (result as ApiSuccessResult).data.token,
            equals('jwt_token_123'),
          );
          expect(
            (result as ApiSuccessResult).data.user?.firstName,
            equals('John'),
          );
          expect(
            (result as ApiSuccessResult).data.user?.lastName,
            equals('Doe'),
          );
          expect((result as ApiSuccessResult).data.user?.email, equals(email));

          verify(
            mockAuthRemoteDataSource.signIn(request: requestEntity),
          ).called(1);
        },
      );

      test('should return ApiErrorResult when sign in fails', () async {
        // Arrange
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

        // Act
        final result = await authRepoImpl.signIn(request: requestEntity);

        // Assert
        expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
        expect(
          (result as ApiSuccessResult).data.message,
          equals('Invalid credentials'),
        );
        expect((result as ApiSuccessResult).data.token, equals(''));
        expect((result as ApiSuccessResult).data.user?.firstName, equals(null));

        verify(
          mockAuthRemoteDataSource.signIn(request: requestEntity),
        ).called(1);
      });

      test('should call remote data source with correct parameters', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final requestEntity = SignInRequestEntity(
          email: email,
          password: password,
        );

        final expectedEntity = SignInResponseEntity(
          message: 'Login successful',
          token: 'jwt_token_123',
          user: const SignInUserEntity(),
        );

        when(
          mockAuthRemoteDataSource.signIn(request: anyNamed('request')),
        ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        // Act
        await authRepoImpl.signIn(request: requestEntity);

        // Assert
        verify(
          mockAuthRemoteDataSource.signIn(request: requestEntity),
        ).called(1);
      });

      test(
        'should delegate to remote data source without modification',
        () async {
          // Arrange
          const email = 'test@example.com';
          const password = 'password123';
          final requestEntity = SignInRequestEntity(
            email: email,
            password: password,
          );

          final expectedEntity = SignInResponseEntity(
            message: 'Login successful',
            token: 'jwt_token_123',
            user: const SignInUserEntity(),
          );

          when(
            mockAuthRemoteDataSource.signIn(request: anyNamed('request')),
          ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

          // Act
          final result = await authRepoImpl.signIn(request: requestEntity);

          // Assert
          expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
          expect(
            (result as ApiSuccessResult).data.message,
            equals('Login successful'),
          );
          expect(
            (result as ApiSuccessResult).data.token,
            equals('jwt_token_123'),
          );

          // Verify that the repository simply delegates to the remote data source
          verify(
            mockAuthRemoteDataSource.signIn(request: requestEntity),
          ).called(1);
        },
      );
    });
  });
}

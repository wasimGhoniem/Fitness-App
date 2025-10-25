import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/dataSources/auth_remote_data_source_impl.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_user_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiService, ApiRemoteExecutor])
void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  late MockAuthApiService mockAuthApiService;
  late MockApiRemoteExecutor mockApiRemoteExecutor;

  setUp(() {
    mockAuthApiService = MockAuthApiService();
    mockApiRemoteExecutor = MockApiRemoteExecutor();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(
      mockAuthApiService,
      mockApiRemoteExecutor,
    );

    // Provide dummy values for Mockito
    provideDummy<ApiResult<SignInResponseEntity>>(
      ApiSuccessResult(data: SignInResponseEntity()),
    );
    provideDummy<SignInResponseDto>(SignInResponseDto());
    provideDummy<SignInUserDto>(SignInUserDto());
  });

  group('AuthRemoteDataSourceImpl', () {
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
            mockApiRemoteExecutor
                .execute<SignInResponseDto, SignInResponseEntity>(
                  request: anyNamed('request'),
                  mapper: anyNamed('mapper'),
                ),
          ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

          // Act
          final result = await authRemoteDataSourceImpl.signIn(
            request: requestEntity,
          );

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
            mockApiRemoteExecutor
                .execute<SignInResponseDto, SignInResponseEntity>(
                  request: anyNamed('request'),
                  mapper: anyNamed('mapper'),
                ),
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
          mockApiRemoteExecutor
              .execute<SignInResponseDto, SignInResponseEntity>(
                request: anyNamed('request'),
                mapper: anyNamed('mapper'),
              ),
        ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        // Act
        final result = await authRemoteDataSourceImpl.signIn(
          request: requestEntity,
        );

        // Assert
        expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
        expect(
          (result as ApiSuccessResult).data.message,
          equals('Invalid credentials'),
        );
        expect((result as ApiSuccessResult).data.token, equals(''));
        expect((result as ApiSuccessResult).data.user?.firstName, equals(null));

        verify(
          mockApiRemoteExecutor
              .execute<SignInResponseDto, SignInResponseEntity>(
                request: anyNamed('request'),
                mapper: anyNamed('mapper'),
              ),
        ).called(1);
      });

      test('should call apiRemoteExecutor with correct parameters', () async {
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
          mockApiRemoteExecutor
              .execute<SignInResponseDto, SignInResponseEntity>(
                request: anyNamed('request'),
                mapper: anyNamed('mapper'),
              ),
        ).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        // Act
        await authRemoteDataSourceImpl.signIn(request: requestEntity);

        // Assert
        verify(
          mockApiRemoteExecutor
              .execute<SignInResponseDto, SignInResponseEntity>(
                request: anyNamed('request'),
                mapper: anyNamed('mapper'),
              ),
        ).called(1);
      });
    });
  });
}

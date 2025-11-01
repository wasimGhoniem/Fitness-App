import 'package:dio/dio.dart';
import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/dataSources/auth_remote_data_source_impl.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_user_dto.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
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

    // Dummy values for Mockito
    provideDummy<ApiResult<SignInResponseEntity>>(
      ApiSuccessResult(data: SignInResponseEntity()),
    );
    provideDummy<SignInResponseDto>(SignInResponseDto());
    provideDummy<SignInUserDto>(SignInUserDto());
  });

  group('AuthRemoteDataSourceImpl', () {
    // ------------------ SIGN IN TESTS ------------------
    group('signIn', () {
      test('should return ApiSuccessResult when sign in is successful', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final requestEntity = SignInRequestEntity(email: email, password: password);

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

        when(mockApiRemoteExecutor.execute<SignInResponseDto, SignInResponseEntity>(
          request: anyNamed('request'),
          mapper: anyNamed('mapper'),
        )).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        // Act
        final result = await authRemoteDataSourceImpl.signIn(request: requestEntity);

        // Assert
        expect(result, isA<ApiSuccessResult<SignInResponseEntity>>());
        final data = (result as ApiSuccessResult).data;
        expect(data.message, equals('Login successful'));
        expect(data.token, equals('jwt_token_123'));
        expect(data.user?.firstName, equals('John'));
      });

      test('should call apiRemoteExecutor with correct parameters', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final requestEntity = SignInRequestEntity(email: email, password: password);

        final expectedEntity = SignInResponseEntity(
          message: 'Login successful',
          token: 'jwt_token_123',
          user: const SignInUserEntity(),
        );

        when(mockApiRemoteExecutor.execute<SignInResponseDto, SignInResponseEntity>(
          request: anyNamed('request'),
          mapper: anyNamed('mapper'),
        )).thenAnswer((_) async => ApiSuccessResult(data: expectedEntity));

        // Act
        await authRemoteDataSourceImpl.signIn(request: requestEntity);

        // Assert
        verify(mockApiRemoteExecutor.execute<SignInResponseDto, SignInResponseEntity>(
          request: anyNamed('request'),
          mapper: anyNamed('mapper'),
        )).called(1);
      });
    });

    // ------------------ SIGN UP TESTS ------------------
    group('signUp', () {
      final tSignUpReqModel = SignUpReqModel(
        email: 'test@test.com',
        password: 'password',
        firstName: 'John',
        lastName: 'Doe',
        rePassword: 'password',
        gender: 'male',
        height: 180,
        weight: 75,
        age: 25,
        goal: 'fitness',
        activityLevel: 'moderate',
      );

      test('should return success when sign up succeeds', () async {
        // Arrange
        when(mockAuthApiService.SignUp(any)).thenAnswer((_) async => Future.value());

        // Act
        final result = await authRemoteDataSourceImpl.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiSuccessResult<void>>());
        verify(mockAuthApiService.SignUp(tSignUpReqModel)).called(1);
      });

      test('should return error result when DioException is thrown', () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        when(mockAuthApiService.SignUp(any)).thenThrow(dioException);

        // Act
        final result = await authRemoteDataSourceImpl.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiErrorResult<void>>());
        expect((result as ApiErrorResult).failure, isA<ServerFailure>());
      });
    });
  });
}

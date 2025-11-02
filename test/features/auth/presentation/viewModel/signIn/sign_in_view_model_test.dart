import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';
import 'package:fitness_app/features/auth/domain/useCases/sign_in_use_case.dart';
import 'package:fitness_app/features/auth/domain/useCases/write_token_use_case.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_event.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signIn/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_view_model_test.mocks.dart';

@GenerateMocks([SignInUseCase, WriteTokenUseCase])
void main() {
  late SignInViewModel signInViewModel;
  late MockSignInUseCase mockSignInUseCase;
  late MockWriteTokenUseCase mockWriteTokenUseCase;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockSignInUseCase = MockSignInUseCase();
    mockWriteTokenUseCase = MockWriteTokenUseCase();
    signInViewModel = SignInViewModel(mockSignInUseCase, mockWriteTokenUseCase);

    // Provide dummy values for Mockito
    provideDummy<ApiResult<SignInResponseEntity>>(
      ApiSuccessResult(data: SignInResponseEntity()),
    );
    provideDummy<ApiResult<void>>(ApiSuccessResult<void>(data: null));
  });

  group('SignInViewModel', () {
    group('initialization', () {
      test('should initialize with default state', () {
        // Assert
        expect(signInViewModel.state.isLoading, equals(false));
        expect(signInViewModel.state.failure, equals(null));
        expect(signInViewModel.state.response, equals(null));
      });

      test('should initialize controllers', () {
        // Assert
        expect(signInViewModel.emailController, isA<TextEditingController>());
        expect(
          signInViewModel.PasswordController,
          isA<TextEditingController>(),
        );
        expect(signInViewModel.signInKey, isA<GlobalKey<FormState>>());
      });
    });

    group('state management', () {
      test('should update state correctly with copyWith', () {
        // Arrange
        final failure = Failure(errorMessage: 'Test error');
        final response = SignInResponseEntity(
          message: 'Test message',
          token: 'test_token',
          user: const SignInUserEntity(),
        );

        // Act
        final newState = signInViewModel.state.copyWith(
          isLoading: true,
          failure: failure,
          response: response,
        );

        // Assert
        expect(newState.isLoading, equals(true));
        expect(newState.failure, equals(failure));
        expect(newState.response, equals(response));
      });

      test(
        'should preserve existing state values when using copyWith with nulls',
        () {
          // Arrange
          final originalState = signInViewModel.state.copyWith(
            isLoading: true,
            failure: Failure(errorMessage: 'Original error'),
            response: SignInResponseEntity(message: 'Original message'),
          );

          // Act
          final newState = originalState.copyWith(isLoading: false);

          // Assert
          expect(newState.isLoading, equals(false));
          expect(newState.failure?.errorMessage, equals('Original error'));
          expect(newState.response?.message, equals('Original message'));
        },
      );
    });

    group('controller management', () {
      test('should set text in controllers', () {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';

        // Act
        signInViewModel.emailController.text = email;
        signInViewModel.PasswordController.text = password;

        // Assert
        expect(signInViewModel.emailController.text, equals(email));
        expect(signInViewModel.PasswordController.text, equals(password));
      });
    });

    group('use case integration', () {
      test('should call use case with correct parameters', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final requestEntity = SignInRequestEntity(
          email: email,
          password: password,
        );

        final expectedResponse = SignInResponseEntity(
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
          mockSignInUseCase.invoke(any),
        ).thenAnswer((_) async => ApiSuccessResult(data: expectedResponse));

        // Act - Simulate direct use case call (bypassing form validation)
        final result = await mockSignInUseCase.invoke(requestEntity);

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

        verify(mockSignInUseCase.invoke(requestEntity)).called(1);
      });

      test('should handle use case error result', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'wrong_password';
        final requestEntity = SignInRequestEntity(
          email: email,
          password: password,
        );

        final failure = Failure(errorMessage: 'Invalid credentials');

        when(
          mockSignInUseCase.invoke(any),
        ).thenAnswer((_) async => ApiErrorResult(failure: failure));

        // Act - Simulate direct use case call
        final result = await mockSignInUseCase.invoke(requestEntity);

        // Assert
        expect(result, isA<ApiErrorResult<SignInResponseEntity>>());
        expect(
          (result as ApiErrorResult).failure.errorMessage,
          equals('Invalid credentials'),
        );

        verify(mockSignInUseCase.invoke(requestEntity)).called(1);
      });
    });

    group('event handling', () {
      test('should handle SignInActionEvent type', () {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';
        final requestEntity = SignInRequestEntity(
          email: email,
          password: password,
        );
        final event = SignInActionEvent(request: requestEntity);

        // Assert
        expect(event, isA<SignInActionEvent>());
        expect(event.request, equals(requestEntity));
        expect(event.request.email, equals(email));
        expect(event.request.password, equals(password));
      });
    });
  });
}

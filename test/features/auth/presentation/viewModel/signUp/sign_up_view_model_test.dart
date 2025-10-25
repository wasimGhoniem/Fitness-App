import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_events.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_state.dart';
import 'package:fitness_app/features/auth/presentation/viewModel/signUp/sign_up_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_view_model_test.mocks.dart';

@GenerateMocks([SignUpUseCase])
void main() {
  late MockSignUpUseCase mockSignUpUseCase;
  late SignupViewModel viewModel;

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

  final tFailure = Failure(errorMessage: 'Something went wrong');

  // Provide a dummy implementation for ApiResult<void> to prevent MissingDummyValueError
  provideDummy<ApiResult<void>>(ApiSuccessResult<void>(data: null));

  setUp(() {
    mockSignUpUseCase = MockSignUpUseCase();
    viewModel = SignupViewModel(mockSignUpUseCase);
  });

  test('initial state is correct', () {
    expect(viewModel.state, const SignUpState());
  });

  group('doIntent(SignUpEvent)', () {
    blocTest<SignupViewModel, SignUpState>(
      'emits [loading, success] when SignUpUseCase returns success',
      build: () {
        when(
          mockSignUpUseCase.invoke(signUpReqModel: anyNamed('signUpReqModel')),
        ).thenAnswer((_) async => ApiSuccessResult<void>(data: null));
        return viewModel;
      },
      act: (cubit) =>
          cubit.doIntent(SignUpEvent(signUpReqModel: tSignUpReqModel)),
      expect: () => <SignUpState>[
        const SignUpState(isLoading: true),
        const SignUpState(isLoading: false, isSucces: true),
      ],
      verify: (_) {
        verify(
          mockSignUpUseCase.invoke(signUpReqModel: tSignUpReqModel),
        ).called(1);
      },
    );

    blocTest<SignupViewModel, SignUpState>(
      'emits [loading, failure] when SignUpUseCase returns error',
      build: () {
        when(
          mockSignUpUseCase.invoke(signUpReqModel: anyNamed('signUpReqModel')),
        ).thenAnswer((_) async => ApiErrorResult<void>(failure: tFailure));
        return viewModel;
      },
      act: (cubit) =>
          cubit.doIntent(SignUpEvent(signUpReqModel: tSignUpReqModel)),
      expect: () => <SignUpState>[
        const SignUpState(isLoading: true),
        SignUpState(isLoading: false, signUpFailure: tFailure),
      ],
      verify: (_) {
        verify(
          mockSignUpUseCase.invoke(signUpReqModel: tSignUpReqModel),
        ).called(1);
      },
    );
  });
}

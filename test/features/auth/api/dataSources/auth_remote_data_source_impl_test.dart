import 'package:dio/dio.dart';
import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/dataSources/auth_remote_data_source_impl.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiService, ApiRemoteExecutor])
void main() {
  late MockAuthApiService mockAuthApiService;
  // Use the real ApiRemoteExecutor to test its try-catch logic
  late ApiRemoteExecutor apiRemoteExecutor;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockAuthApiService = MockAuthApiService();
    apiRemoteExecutor = ApiRemoteExecutor();
    dataSource = AuthRemoteDataSourceImpl(
      mockAuthApiService,
      apiRemoteExecutor,
    );
  });

  final tSignUpReqModel = SignUpReqModel(
    email: 'test@test.com',
    password: 'password',
    firstName: '',
    lastName: '',
    rePassword: '',
    gender: '',
    height: 1,
    weight: 1,
    age: 1,
    goal: '',
    activityLevel: '',
  );

  group('signUp', () {
    test(
      'should call remoteExecutor.execute and return success result when sign up is successful',
      () async {
        // Arrange
        // When the service is called, it should complete successfully.
        when(
          mockAuthApiService.SignUp(any),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await dataSource.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiSuccessResult<void>>());
        expect((result as ApiSuccessResult).data, isNull);
        // Verify that the api service method was called inside the request closure.
        verify(mockAuthApiService.SignUp(tSignUpReqModel)).called(1);
      },
    );

    test(
      'should return error result when remoteExecutor.execute throws an exception',
      () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        // When the service is called, simulate a DioException.
        when(mockAuthApiService.SignUp(any)).thenThrow(dioException);

        // Act
        final result = await dataSource.signUp(tSignUpReqModel);

        // Assert
        expect(result, isA<ApiErrorResult<void>>());
        expect((result as ApiErrorResult).failure, isA<ServerFailure>());
      },
    );
  });
}

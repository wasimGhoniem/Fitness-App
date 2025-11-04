import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/mapper/forgetPassword/forget_password_mapper.dart';
import 'package:fitness_app/features/auth/api/mapper/forgetPassword/reset_password_mapper.dart';
import 'package:fitness_app/features/auth/api/mapper/forgetPassword/verify_reset_code_mapper.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/verify_reset_code_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/reset_password_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/verify_reset_code_response_dto.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._apiServices,@Named(AppConstants.apiRemoteExecutor) this._executor);

  final AuthApiService _apiServices;
  final RemoteExecutor _executor;

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) async {
    final dto = ForgetPasswordRequestDto.fromEntity(request);
    return _executor
        .execute<ForgetPasswordResponseDto, ForgetPasswordResponseEntity>(
          request: () => _apiServices.forgetPassword(dto),
          mapper: (response) => response.toEntity(),
        );
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) async {
    final dto = ResetPasswordRequestDto.fromEntity(request);
    return _executor
        .execute<ResetPasswordResponseDto, ResetPasswordResponseEntity>(
          request: () => _apiServices.resetPassword(dto),
          mapper: (response) => response.toEntity(),
        );
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
    VerifyResetCodeRequestEntity request,
  ) async {
    final dto = VerifyResetCodeRequestDto.fromEntity(request);
    return _executor
        .execute<VerifyResetCodeResponseDto, VerifyResetCodeResponseEntity>(
          request: () => _apiServices.verifyResetCode(dto),
          mapper: (response) => response.toEntity(),
        );
  }
}

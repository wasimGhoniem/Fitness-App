import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/request/verify_reset_code_request_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/reset_password_response_dto.dart';
import 'package:fitness_app/features/auth/api/model/forgetPassword/response/verify_reset_code_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth_api_service.g.dart';

@singleton
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto request,
  );

  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
    @Body() VerifyResetCodeRequestDto request,
  );

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto request,
  );
}

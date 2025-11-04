import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request,
      );

  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request,
      );

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      );
}

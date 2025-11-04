import 'package:fitness_app/features/auth/api/model/forgetPassword/response/reset_password_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';

extension ResetPasswordMapper on ResetPasswordResponseDto {
  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(message: message, token: token);
  }
}

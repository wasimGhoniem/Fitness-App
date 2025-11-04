import 'package:fitness_app/features/auth/api/model/forgetPassword/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';

extension ForgetPasswordDtoMapper on ForgetPasswordResponseDto {
  ForgetPasswordResponseEntity toEntity() {
    return ForgetPasswordResponseEntity(message: message, info: info);
  }
}

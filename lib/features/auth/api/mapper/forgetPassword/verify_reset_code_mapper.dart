import 'package:fitness_app/features/auth/api/model/forgetPassword/response/verify_reset_code_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';

extension VerifyResetCodeMapper on VerifyResetCodeResponseDto {
  VerifyResetCodeResponseEntity toEntity() {
    return VerifyResetCodeResponseEntity(status: status);
  }
}

import 'package:fitness_app/features/changePassowrd/api/model/response/change_password_response_dto.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';

extension ChangePasswordMapper on ChangePasswordResponseDto {
  ChangePasswordEntity toEntity() {
    return ChangePasswordEntity(token: token ?? '');
  }
}

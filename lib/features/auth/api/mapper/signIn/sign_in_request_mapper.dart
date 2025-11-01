import 'package:fitness_app/features/auth/api/model/signIn/request/sign_in_request_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';

extension SignInRequestEntityMapper on SignInRequestEntity {
  SignInRequestDto toDto() {
    return SignInRequestDto(email: email, password: password);
  }
}

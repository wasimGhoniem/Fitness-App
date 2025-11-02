import 'package:fitness_app/features/auth/api/mapper/signIn/sign_in_user_mapper.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';

extension SignInResponseDtoMapper on SignInResponseDto {
  SignInResponseEntity toEntity() {
    return SignInResponseEntity(
      message: message ?? '',
      token: token,
      user: user?.toEntity() ?? const SignInUserEntity(),
    );
  }
}

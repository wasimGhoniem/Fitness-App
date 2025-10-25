import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_user_dto.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';

extension SignInUserDtoMapper on SignInUserDto {
  SignInUserEntity toEntity() {
    return SignInUserEntity(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      gender: gender ?? '',
      age: age ?? 0,
      weight: weight ?? 0,
      height: height ?? 0,
      activityLevel: activityLevel ?? '',
      goal: goal ?? '',
      photo: photo ?? '',
      createdAt: createdAt ?? '',
    );
  }
}

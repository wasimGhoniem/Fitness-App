import 'package:fitness_app/features/profileMain/api/models/logged_user_dto.dart';
import 'package:fitness_app/features/profileMain/domain/entities/logged_user_entity.dart';

extension LoggedUserDtoMapper on UserDto {
  LoggedUserEntity toEntity() {
    return LoggedUserEntity(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      gender: gender ?? '',
      photo: photo ?? '',
      height: height ?? 0,
      weight: weight ?? 0,
      age: age ?? 0,
      activityLevel: activityLevel ?? '',
      goal: goal ?? '',
    );
  }
}

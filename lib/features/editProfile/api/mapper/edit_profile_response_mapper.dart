import 'package:fitness_app/features/editProfile/api/model/response/edit_profile_response_dto.dart';
import 'package:fitness_app/features/editProfile/api/model/response/edit_profile_user_dto.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_user_entity.dart';

extension EditProfileResponseDtoMapper on EditProfileResponseDto {
  EditProfileResponseEntity toEntity() {
    return EditProfileResponseEntity(
      message: message ?? '',
      user: user?.toEntity() ?? const EditProfileUserEntity(),
    );
  }
}

extension EditProfileUserDtoMapper on EditProfileUserDto {
  EditProfileUserEntity toEntity() {
    return EditProfileUserEntity(
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

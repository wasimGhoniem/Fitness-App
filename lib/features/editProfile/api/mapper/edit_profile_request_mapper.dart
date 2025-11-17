import 'package:fitness_app/features/editProfile/api/model/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';

extension EditProfileRequestEntityMapper on EditProfileRequestEntity {
  EditProfileRequestDto toDto() {
    return EditProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      email: email,
      weight: weight,
      goal: goal,
      activityLevel: activityLevel,
    );
  }
}

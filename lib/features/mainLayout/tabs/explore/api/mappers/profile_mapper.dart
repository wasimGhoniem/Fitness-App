import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_data_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';

extension ProfileDataResponseMapper on ProfileDataResponseDto {
  ProfileDataResponseEntity toEntity() {
    return ProfileDataResponseEntity(
      message: message ?? '',
      profile:
          profile?.toEntity() ??
          const ProfileEntity(id: '', name: '', email: '', avatar: ''),
    );
  }
}

extension ProfileMapper on ProfileDto {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
    );
  }
}

import 'package:fitness_app/features/profileMain/api/mapper/logged_user_mapper.dart';
import 'package:fitness_app/features/profileMain/api/models/response/logged_user_data_response_dto.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';

extension LoggedUserDataResponseDtoMapper on LoggedUserDataResponseDto {
  LoggedUserDataResponseEntity toEntity() {
    return LoggedUserDataResponseEntity(
      message: message ?? '',
      user: user?.toEntity(),
    );
  }
}

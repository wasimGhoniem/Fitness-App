import 'package:fitness_app/features/editProfile/api/model/response/edit_profile_user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  EditProfileResponseDto({this.message, this.user});

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseDtoFromJson(json);
  }

  final String? message;
  final EditProfileUserDto? user;

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);
}

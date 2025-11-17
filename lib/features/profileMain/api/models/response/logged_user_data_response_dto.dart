import 'package:fitness_app/features/profileMain/api/models/logged_user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user_data_response_dto.g.dart';

@JsonSerializable()
class LoggedUserDataResponseDto {
  factory LoggedUserDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserDataResponseDtoFromJson(json);
  }

  LoggedUserDataResponseDto({this.message, this.user});

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'user')
  final UserDto? user;

  Map<String, dynamic> toJson() {
    return _$LoggedUserDataResponseDtoToJson(this);
  }
}

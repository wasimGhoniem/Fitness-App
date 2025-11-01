import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseDtoFromJson(json);
  }

  SignInResponseDto ({
    this.message,
    this.user,
    this.token,
  });
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'user')
  final SignInUserDto? user;
  @JsonKey(name: 'token')
  final String? token;

  Map<String, dynamic> toJson() {
    return _$SignInResponseDtoToJson(this);
  }
}





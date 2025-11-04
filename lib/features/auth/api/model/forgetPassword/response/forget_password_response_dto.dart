import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseDtoFromJson(json);
  }

  ForgetPasswordResponseDto ({
    this.message,
    this.info,
  });
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'info')
  final String? info;

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordResponseDtoToJson(this);
  }
}



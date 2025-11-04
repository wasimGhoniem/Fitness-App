import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestDtoFromJson(json);
  }

  factory ForgetPasswordRequestDto.fromEntity(ForgetPasswordRequestEntity entity) {
    return ForgetPasswordRequestDto(
      email: entity.email,
    );
  }

  ForgetPasswordRequestDto ({
    this.email,
  });
  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordRequestDtoToJson(this);
  }
}



import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestDtoFromJson(json);
  }

  factory ResetPasswordRequestDto.fromEntity(ResetPasswordRequestEntity entity) {
    return ResetPasswordRequestDto(
      email: entity.email,
      newPassword: entity.newPassword,
    );
  }

  ResetPasswordRequestDto ({
    this.email,
    this.newPassword,
  });

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'newPassword')
  final String? newPassword;


  Map<String, dynamic> toJson() {
    return _$ResetPasswordRequestDtoToJson(this);
  }
}



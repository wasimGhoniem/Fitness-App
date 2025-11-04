import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestDtoFromJson(json);
  }

  factory VerifyResetCodeRequestDto.fromEntity(VerifyResetCodeRequestEntity entity) {
    return VerifyResetCodeRequestDto(
      resetCode: entity.resetCode,
    );
  }

  VerifyResetCodeRequestDto ({
    this.resetCode,
  });
  @JsonKey(name: 'resetCode')
  final String? resetCode;


  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestDtoToJson(this);
  }
}



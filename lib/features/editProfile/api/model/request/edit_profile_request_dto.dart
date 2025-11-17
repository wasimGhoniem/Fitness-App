import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  EditProfileRequestDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.weight,
    required this.goal,
    required this.activityLevel,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileRequestDtoFromJson(json);
  }

  @JsonKey(name: 'firstName')
  final String firstName;

  @JsonKey(name: 'lastName')
  final String lastName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'weight')
  final int weight;

  @JsonKey(name: 'goal')
  final String goal;

  @JsonKey(name: 'activityLevel')
  final String activityLevel;

  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);
}

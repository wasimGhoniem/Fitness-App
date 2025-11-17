import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_user_dto.g.dart';

@JsonSerializable()
class EditProfileUserDto {
  EditProfileUserDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.createdAt,
  });

  factory EditProfileUserDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileUserDtoFromJson(json);
  }

  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final int? weight;
  final int? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$EditProfileUserDtoToJson(this);
}

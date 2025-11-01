import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto {
  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
  ProfileDto({this.id, this.name, this.email, this.avatar});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'firstName')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'photo')
  final String? avatar;

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

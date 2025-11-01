import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_data_response_dto.g.dart';

@JsonSerializable()
class ProfileDataResponseDto {
  factory ProfileDataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseDtoFromJson(json);
  ProfileDataResponseDto({this.message, this.profile});

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'user')
  final ProfileDto? profile;

  Map<String, dynamic> toJson() => _$ProfileDataResponseDtoToJson(this);
}

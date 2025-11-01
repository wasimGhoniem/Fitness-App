import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_groups_response_dto.g.dart';

@JsonSerializable()
class MusclesGroupsResponseDto {
  factory MusclesGroupsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesGroupsResponseDtoFromJson(json);
  MusclesGroupsResponseDto({this.message, this.musclesGroup});

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'musclesGroup')
  final List<MuscleGroupDto>? musclesGroup;

  Map<String, dynamic> toJson() => _$MusclesGroupsResponseDtoToJson(this);
}

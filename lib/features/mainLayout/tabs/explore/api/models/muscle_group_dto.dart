import 'package:json_annotation/json_annotation.dart';

part 'muscle_group_dto.g.dart';

@JsonSerializable()
class MuscleGroupDto {
  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupDtoFromJson(json);
  MuscleGroupDto({this.id, this.name});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;

  Map<String, dynamic> toJson() => _$MuscleGroupDtoToJson(this);
}

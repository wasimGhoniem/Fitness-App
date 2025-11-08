import 'package:json_annotation/json_annotation.dart';

part 'difficulty_level_dto.g.dart';

@JsonSerializable()
class DifficultyLevelDto {
  DifficultyLevelDto({this.id, this.name});

  factory DifficultyLevelDto.fromJson(Map<String, dynamic> json) =>
      _$DifficultyLevelDtoFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;

  Map<String, dynamic> toJson() => _$DifficultyLevelDtoToJson(this);
}

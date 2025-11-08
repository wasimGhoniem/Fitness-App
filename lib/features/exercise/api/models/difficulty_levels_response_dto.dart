import 'package:fitness_app/features/exercise/api/models/difficulty_level_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'difficulty_levels_response_dto.g.dart';

@JsonSerializable()
class DifficultyLevelsResponseDto {
  DifficultyLevelsResponseDto({this.message, this.difficultyLevels});

  factory DifficultyLevelsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DifficultyLevelsResponseDtoFromJson(json);
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'difficulty_levels')
  final List<DifficultyLevelDto>? difficultyLevels;

  Map<String, dynamic> toJson() => _$DifficultyLevelsResponseDtoToJson(this);
}

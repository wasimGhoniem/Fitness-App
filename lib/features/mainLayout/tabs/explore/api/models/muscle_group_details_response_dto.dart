import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscle_group_details_response_dto.g.dart';

@JsonSerializable()
class MuscleGroupDetailsResponseDto {
  factory MuscleGroupDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupDetailsResponseDtoFromJson(json);
  MuscleGroupDetailsResponseDto({this.message, this.muscleGroup, this.muscles});

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'muscleGroup')
  final MuscleGroupDto? muscleGroup;

  @JsonKey(name: 'muscles')
  final List<MuscleDto>? muscles;

  Map<String, dynamic> toJson() => _$MuscleGroupDetailsResponseDtoToJson(this);
}

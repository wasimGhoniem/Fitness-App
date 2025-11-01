import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_response_dto.g.dart';

@JsonSerializable()
class MusclesResponseDto {
  factory MusclesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesResponseDtoFromJson(json);
  MusclesResponseDto({this.message, this.totalMuscles, this.muscles});
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'totalMuscles')
  final int? totalMuscles;
  @JsonKey(name: 'muscles')
  final List<MuscleDto>? muscles;
  Map<String, dynamic> toJson() => _$MusclesResponseDtoToJson(this);
}

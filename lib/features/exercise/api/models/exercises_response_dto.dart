import 'package:fitness_app/features/exercise/api/models/exercise_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercises_response_dto.g.dart';

@JsonSerializable()
class ExercisesResponseDto {
  ExercisesResponseDto({
    this.message,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });

  factory ExercisesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExercisesResponseDtoFromJson(json);
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'totalPages')
  final int? totalPages;
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'exercises')
  final List<ExerciseDto>? exercises;
  Map<String, dynamic> toJson() => _$ExercisesResponseDtoToJson(this);
}

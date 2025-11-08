import 'package:json_annotation/json_annotation.dart';

part 'exercise_dto.g.dart';

@JsonSerializable()
class ExerciseDto {
  ExerciseDto({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.sets,
    this.reps,
    this.duration,
  });

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'exercise')
  final String? name;
  @JsonKey(name: 'combination_exercise')
  final String? description;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'short_youtube_demonstration_link')
  final String? videoUrl;
  final int? sets;
  final int? reps;
  final int? duration;

  Map<String, dynamic> toJson() => _$ExerciseDtoToJson(this);
}

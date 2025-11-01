import 'package:json_annotation/json_annotation.dart';

part 'muscle_dto.g.dart';

@JsonSerializable()
class MuscleDto {
  factory MuscleDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleDtoFromJson(json);
  MuscleDto({this.id, this.name, this.image});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final String? image;
  Map<String, dynamic> toJson() => _$MuscleDtoToJson(this);
}

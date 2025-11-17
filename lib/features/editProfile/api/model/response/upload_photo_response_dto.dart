import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_response_dto.g.dart';

@JsonSerializable()
class UploadPhotoResponseDto {

  UploadPhotoResponseDto({required this.message});

  factory UploadPhotoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UploadPhotoResponseDtoFromJson(json);
  final String message;

  Map<String, dynamic> toJson() => _$UploadPhotoResponseDtoToJson(this);
}
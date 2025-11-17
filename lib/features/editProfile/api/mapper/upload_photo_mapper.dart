import 'package:fitness_app/features/editProfile/api/model/response/upload_photo_response_dto.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';

extension UploadPhotoMapper on UploadPhotoResponseDto {
  UploadPhotoResponseEntity toEntity() {
    return UploadPhotoResponseEntity(message: message);
  }
}

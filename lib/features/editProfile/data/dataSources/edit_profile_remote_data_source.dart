import 'dart:io';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';

abstract interface class EditProfileRemoteDataSource {
  Future<ApiResult<EditProfileResponseEntity>> editProfile({
    required EditProfileRequestEntity requestEntity,
  });

  Future<ApiResult<UploadPhotoResponseEntity>> uploadProfilePhoto(
    File imageFile,
  );
}

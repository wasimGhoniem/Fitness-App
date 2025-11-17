import 'dart:io';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/repositories/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  UploadPhotoUseCase(this._editProfileRepository);

  final EditProfileRepository _editProfileRepository;

  Future<ApiResult<UploadPhotoResponseEntity>> invoke(File imageFile) async {
    return await _editProfileRepository.uploadProfilePhoto(imageFile);
  }
}

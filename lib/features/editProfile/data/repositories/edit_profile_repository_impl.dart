import 'dart:io';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/editProfile/data/dataSources/edit_profile_remote_data_source.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/repositories/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  EditProfileRepositoryImpl(this._remoteDataSource);

  final EditProfileRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile({
    required EditProfileRequestEntity requestEntity,
  }) {
    return _remoteDataSource.editProfile(requestEntity: requestEntity);
  }

  @override
  Future<ApiResult<UploadPhotoResponseEntity>> uploadProfilePhoto(
    File imageFile,
  ) {
    return _remoteDataSource.uploadProfilePhoto(imageFile);
  }
}

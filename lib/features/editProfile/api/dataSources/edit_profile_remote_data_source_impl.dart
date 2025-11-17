import 'dart:io';
import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/editProfile/api/client/edit_profile_api_service.dart';
import 'package:fitness_app/features/editProfile/api/mapper/edit_profile_response_mapper.dart';
import 'package:fitness_app/features/editProfile/api/mapper/upload_photo_mapper.dart';
import 'package:fitness_app/features/editProfile/api/model/response/edit_profile_response_dto.dart';
import 'package:fitness_app/features/editProfile/api/model/response/upload_photo_response_dto.dart';
import 'package:fitness_app/features/editProfile/data/dataSources/edit_profile_remote_data_source.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/api/mapper/edit_profile_request_mapper.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  EditProfileRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._apiRemoteExecutor,
  );

  final EditProfileApiService _apiService;
  final RemoteExecutor _apiRemoteExecutor;

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile({
    required EditProfileRequestEntity requestEntity,
  }) async {
    return await _apiRemoteExecutor
        .execute<EditProfileResponseDto, EditProfileResponseEntity>(
          request: () => _apiService.editProfile(requestEntity.toDto()),
          mapper: (response) => response.toEntity(),
        );
  }

  @override
  Future<ApiResult<UploadPhotoResponseEntity>> uploadProfilePhoto(
    File imageFile,
  ) async {
    return await _apiRemoteExecutor
        .execute<UploadPhotoResponseDto, UploadPhotoResponseEntity>(
          request: () => _apiService.uploadProfilePhoto(imageFile),
          mapper: (response) => response.toEntity(),
        );
  }
}

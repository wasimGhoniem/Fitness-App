import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/editProfile/api/model/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/editProfile/api/model/response/edit_profile_response_dto.dart';
import 'package:fitness_app/features/editProfile/api/model/response/upload_photo_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'edit_profile_api_service.g.dart';

@singleton
@RestApi()
abstract class EditProfileApiService {
  @factoryMethod
  factory EditProfileApiService(@Named(ApiConstants.fitnessDio) Dio dio) =
      _EditProfileApiService;

  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponseDto> editProfile(
    @Body() EditProfileRequestDto requestDto,
  );

  @PUT(ApiConstants.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseDto> uploadProfilePhoto(
      @Part(name: 'photo') File photo,
      );

}

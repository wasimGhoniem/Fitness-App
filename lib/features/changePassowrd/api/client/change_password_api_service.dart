import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/api/model/response/change_password_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'change_password_api_service.g.dart';

@singleton
@RestApi()
abstract class ChangePasswordApiService {
  @factoryMethod
  factory ChangePasswordApiService(@Named(ApiConstants.fitnessDio) Dio dio) =
      _ChangePasswordApiService;

  @PATCH(ApiConstants.changePasswordEndPoint)
  Future<ChangePasswordResponseDto> resetPassword(
    @Body() ChangePasswordRequestModel resetPasswordRequestModel,
  );
}

import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/profileMain/api/models/response/logged_user_data_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'profile_api_service.g.dart';

@RestApi()
@injectable
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(
      @Named(ApiConstants.fitnessDio)Dio dio) = _ProfileApiService;

  @GET(ApiConstants.getLoggedUserData)
  Future<LoggedUserDataResponseDto> getLoggedUserData();
}

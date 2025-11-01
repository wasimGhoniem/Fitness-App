import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_details_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_groups_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_data_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'explore_api_service.g.dart';

@singleton
@RestApi()
abstract class ExploreApiService {
  @factoryMethod
  factory ExploreApiService(Dio dio) = _ExploreApiService;
  //!Recommendation to day section
  @GET(ApiConstants.randomMusclesEndPoint)
  Future<MusclesResponseDto> getRandomMuscles();
  //!Upcoming Workouts section
  @GET(ApiConstants.musclesEndPoint)
  Future<MusclesGroupsResponseDto> getMusclesGroups();

  @GET(ApiConstants.musclesGroupEndPoint)
  Future<MuscleGroupDetailsResponseDto> getMusclesByGroupId(
    @Path('id') String id,
  );
  //!Profile Data
  @GET(ApiConstants.authProfileDataEndPoint)
  Future<ProfileDataResponseDto> getProfileData();
}

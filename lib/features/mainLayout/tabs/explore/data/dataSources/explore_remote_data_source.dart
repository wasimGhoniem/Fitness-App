import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';

abstract interface class ExploreRemoteDataSource {
  Future<ApiResult<MuscleResponseEntity>> getRandomMuscles();
  Future<ApiResult<MusclesGroupsResponseEntity>> getMusclesGroups();
  Future<ApiResult<MuscleGroupDetailsResponseEntity>> getMusclesByGroupId(
    String id,
  );

  Future<ApiResult<ProfileDataResponseEntity>> getProfileData();
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/data/dataSources/explore_remote_data_source.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/repositories/explore_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements ExploreRepo {
  ExploreRepoImpl(this._remoteDataSource);

  final ExploreRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<MuscleResponseEntity>> getRandomMuscles() {
    return _remoteDataSource.getRandomMuscles();
  }

  @override
  Future<ApiResult<MusclesGroupsResponseEntity>> getMusclesGroups() {
    return _remoteDataSource.getMusclesGroups();
  }

  @override
  Future<ApiResult<MuscleGroupDetailsResponseEntity>> getMusclesByGroupId(
    String id,
  ) {
    return _remoteDataSource.getMusclesByGroupId(id);
  }

  @override
  Future<ApiResult<ProfileDataResponseEntity>> getProfileData() {
    return _remoteDataSource.getProfileData();
  }
}

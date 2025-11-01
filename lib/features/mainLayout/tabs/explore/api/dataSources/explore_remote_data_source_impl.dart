import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/client/explore_api_service.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/mappers/muscle_group_mapper.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/mappers/muscle_mapper.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/mappers/profile_mapper.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_details_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_groups_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/profile_data_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/data/dataSources/explore_remote_data_source.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  ExploreRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final ExploreApiService _apiService;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<MuscleResponseEntity>> getRandomMuscles() {
    return _remoteExecutor.execute<MusclesResponseDto, MuscleResponseEntity>(
      request: () => _apiService.getRandomMuscles(),
      mapper: (dto) => dto.toEntity(),
    );
  }

  @override
  Future<ApiResult<MusclesGroupsResponseEntity>> getMusclesGroups() {
    return _remoteExecutor
        .execute<MusclesGroupsResponseDto, MusclesGroupsResponseEntity>(
          request: () => _apiService.getMusclesGroups(),
          mapper: (dto) => dto.toEntity(),
        );
  }

  @override
  Future<ApiResult<MuscleGroupDetailsResponseEntity>> getMusclesByGroupId(
    String id,
  ) {
    return _remoteExecutor.execute<
      MuscleGroupDetailsResponseDto,
      MuscleGroupDetailsResponseEntity
    >(
      request: () => _apiService.getMusclesByGroupId(id),
      mapper: (dto) => dto.toEntity(),
    );
  }

  @override
  Future<ApiResult<ProfileDataResponseEntity>> getProfileData() {
    return _remoteExecutor
        .execute<ProfileDataResponseDto, ProfileDataResponseEntity>(
          request: () => _apiService.getProfileData(),
          mapper: (dto) => dto.toEntity(),
        );
  }
}

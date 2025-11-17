import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/profileMain/api/client/profile_api_service.dart';
import 'package:fitness_app/features/profileMain/api/mapper/logged_user_response_mapper.dart';
import 'package:fitness_app/features/profileMain/api/models/response/logged_user_data_response_dto.dart';
import 'package:fitness_app/features/profileMain/data/dataSources/profile_main_remote_data_source.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileMainRemoteDataSource)
class ProfileMainRemoteDataSourceImpl implements ProfileMainRemoteDataSource {
  ProfileMainRemoteDataSourceImpl(
    this._apiService,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final ProfileApiService _apiService;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<LoggedUserDataResponseEntity>> getLoggedUserData() {
    return _remoteExecutor
        .execute<LoggedUserDataResponseDto, LoggedUserDataResponseEntity>(
          request: () => _apiService.getLoggedUserData(),
          mapper: (response) => response.toEntity(),
        );
  }
}

import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/changePassowrd/api/client/change_password_api_service.dart';
import 'package:fitness_app/features/changePassowrd/api/mappers/change_password_mapper.dart';
import 'package:fitness_app/features/changePassowrd/api/model/request/change_password_request_model.dart';
import 'package:fitness_app/features/changePassowrd/data/dataSources/change_password_data_source.dart';
import 'package:fitness_app/features/changePassowrd/domain/entity/change_password_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRemoteDataSource)
class ChangePasswordDataSourceImpl implements ChangePasswordRemoteDataSource {
  ChangePasswordDataSourceImpl(
    this._changePasswordApiService,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final ChangePasswordApiService _changePasswordApiService;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) {
    return _remoteExecutor.execute(
      request: () =>
          _changePasswordApiService.resetPassword(changePasswordRequestModel),
      mapper: (response) => response.toEntity(),
    );
  }
}

import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(
    this._apiServices,
    @Named(AppConstants.apiRemoteExecutor) this._remoteExecutor,
  );

  final AuthApiService _apiServices;
  final RemoteExecutor _remoteExecutor;

  @override
  Future<ApiResult<void>> signUp(SignUpReqModel signUpReqModel) {
    return _remoteExecutor.execute<void, void>(
      request: () => _apiServices.SignUp(signUpReqModel),
    );
  }
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn({
    required SignInRequestEntity request,
  }) {
    return _authRemoteDataSource.signIn(request: request);
  }

  @override
  Future<ApiResult<void>> signUp(SignUpReqModel signUpReqModel) {
    return _authRemoteDataSource.signUp(signUpReqModel);
  }

  @override
  Future<ApiResult<void>> writeToken({required String token}) async {
    return await _authLocalDataSource.WriteToken(token: token);
  }

  @override
  Future<ApiResult<void>> deleteToken() async {
    return await _authLocalDataSource.deleteToken();
  }
}

import 'package:fitness_app/core/errors/api_results.dart';
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

  // ignore: unused_field
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn({
    required SignInRequestEntity request,
  }) {
    return _authRemoteDataSource.signIn(request: request);
  }
}

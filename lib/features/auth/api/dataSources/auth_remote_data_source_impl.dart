import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._apiServices);

  // ignore: unused_field
  final AuthApiService _apiServices;
}

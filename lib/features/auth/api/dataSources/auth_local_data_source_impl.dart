import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(@Named(AppConstants.secureStorage) this._storage);

  // ignore: unused_field
  final Storage _storage;
}

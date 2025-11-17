import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/profileMain/data/dataSources/profile_main_local_data_source.dart';
import 'package:fitness_app/features/profileMain/data/dataSources/profile_main_remote_data_source.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';
import 'package:fitness_app/features/profileMain/domain/repositories/profile_main_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileMainRepo)
class ProfileMainRepoImpl implements ProfileMainRepo {
  ProfileMainRepoImpl(
    this._profileRemoteDataSource,
    this._profileLocalDataSource,
  );
  final ProfileMainRemoteDataSource _profileRemoteDataSource;
  final ProfileMainLocalDataSource _profileLocalDataSource;

  @override
  Future<ApiResult<LoggedUserDataResponseEntity>> getLoggedUserData() {
    return _profileRemoteDataSource.getLoggedUserData();
  }

  @override
  Future<SecurityRolesConfigEntity> getSecurityRolesConfig() {
    return _profileLocalDataSource.getSecurityRolesConfig();
  }

  @override
  Future<PrivacyPolicyEntity> getPrivacyPolicy() {
    return _profileLocalDataSource.getPrivacyPolicy();
  }

  @override
  Future<HelpContentEntity> getHelpContent() {
    return _profileLocalDataSource.getHelpContent();
  }
}

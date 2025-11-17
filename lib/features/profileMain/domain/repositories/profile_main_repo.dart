import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';

abstract class ProfileMainRepo {
  Future<ApiResult<LoggedUserDataResponseEntity>> getLoggedUserData();

  Future<SecurityRolesConfigEntity> getSecurityRolesConfig();

  Future<PrivacyPolicyEntity> getPrivacyPolicy();

  Future<HelpContentEntity> getHelpContent();
}

import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';

abstract interface class ProfileMainLocalDataSource {
  Future<SecurityRolesConfigEntity> getSecurityRolesConfig();

  Future<PrivacyPolicyEntity> getPrivacyPolicy();

  Future<HelpContentEntity> getHelpContent();
}

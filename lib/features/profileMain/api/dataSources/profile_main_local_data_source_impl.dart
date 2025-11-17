import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/profileMain/api/mapper/help_content_mapper.dart';
import 'package:fitness_app/features/profileMain/api/mapper/privacy_policy_mapper.dart';
import 'package:fitness_app/features/profileMain/api/mapper/security_roles_config_mapper.dart';
import 'package:fitness_app/features/profileMain/api/models/help_content_model.dart';
import 'package:fitness_app/features/profileMain/api/models/privacy_policy_model.dart';
import 'package:fitness_app/features/profileMain/api/models/security_roles_config_model.dart';
import 'package:fitness_app/features/profileMain/data/dataSources/profile_main_local_data_source.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';

@Injectable(as: ProfileMainLocalDataSource)
class ProfileMainLocalDataSourceImpl implements ProfileMainLocalDataSource {
  const ProfileMainLocalDataSourceImpl();

  @override
  Future<SecurityRolesConfigEntity> getSecurityRolesConfig() async {
    final String jsonString = await rootBundle.loadString(
      AppConstants.securityRolesConfigPath,
    );
    final Map<String, dynamic> data =
        json.decode(jsonString) as Map<String, dynamic>;
    final SecurityRolesConfigModel model = SecurityRolesConfigModel.fromJson(
      data,
    );

    return model.toEntity();
  }

  @override
  Future<PrivacyPolicyEntity> getPrivacyPolicy() async {
    final String jsonString = await rootBundle.loadString(
      AppConstants.privacyAndSecurityPath,
    );
    final Map<String, dynamic> data =
        json.decode(jsonString) as Map<String, dynamic>;
    final PrivacyPolicyModel model = PrivacyPolicyModel.fromJson(data);

    return model.toEntity();
  }

  @override
  Future<HelpContentEntity> getHelpContent() async {
    final String jsonString = await rootBundle.loadString(
      AppConstants.helpPath,
    );
    final Map<String, dynamic> data =
        json.decode(jsonString) as Map<String, dynamic>;
    final HelpContentModel model = HelpContentModel.fromJson(data);

    return model.toEntity();
  }
}

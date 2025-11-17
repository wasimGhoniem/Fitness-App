import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';
import 'package:fitness_app/features/profileMain/api/models/security_roles_config_model.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';

extension SecurityRolesConfigModelMapper on SecurityRolesConfigModel {
  SecurityRolesConfigEntity toEntity() {
    return SecurityRolesConfigEntity(
      pageTitle: pageTitle?.toEntity(),
      pageDescription: pageDescription?.toEntity(),
      roleListTitle: roleListTitle?.toEntity(),
      roles: roles?.map((RoleDefinitionModel e) => e.toEntity()).toList(),
    );
  }
}

extension RoleDefinitionModelMapper on RoleDefinitionModel {
  RoleDefinitionEntity toEntity() {
    return RoleDefinitionEntity(
      roleId: roleId,
      name: name?.toEntity(),
      description: description?.toEntity(),
      highlightColor: style?.highlightColor,
      fontWeight: style?.fontWeight,
      permissions:
          permissions?.map((PermissionModel e) => e.toEntity()).toList(),
    );
  }
}

extension PermissionModelMapper on PermissionModel {
  PermissionEntity toEntity() {
    return PermissionEntity(
      key: key,
      name: name?.toEntity(),
      description: description?.toEntity(),
    );
  }
}

extension LocalizedTextModelMapper on LocalizedTextModel {
  LocalizedText toEntity() {
    return LocalizedText(
      en: en,
      ar: ar,
    );
  }
}


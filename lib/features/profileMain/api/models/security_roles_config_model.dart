import 'package:fitness_app/features/profileMain/api/models/localized_models.dart';

class SecurityRolesConfigModel {
  const SecurityRolesConfigModel({
    this.pageTitle,
    this.pageDescription,
    this.roleListTitle,
    this.roles,
  });

  factory SecurityRolesConfigModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sections =
        json['security_roles_config'] as List<dynamic>? ?? <dynamic>[];

    LocalizedTextModel? pageTitle;
    LocalizedTextModel? pageDescription;
    LocalizedTextModel? roleListTitle;
    final List<RoleDefinitionModel> roles = <RoleDefinitionModel>[];

    for (final dynamic entry in sections) {
      if (entry is! Map<String, dynamic>) continue;

      final String? section = entry['section'] as String?;

      switch (section) {
        case 'page_title':
          pageTitle = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'page_description':
          pageDescription = LocalizedTextModel.fromJson(
            entry['content'] as Map<String, dynamic>?,
          );
          break;
        case 'role_list_title':
          roleListTitle = LocalizedTextModel.fromJson(
            entry['title'] as Map<String, dynamic>?,
          );
          break;
        case 'role_definition':
          roles.add(RoleDefinitionModel.fromJson(entry));
          break;
        default:
          break;
      }
    }

    return SecurityRolesConfigModel(
      pageTitle: pageTitle,
      pageDescription: pageDescription,
      roleListTitle: roleListTitle,
      roles: roles,
    );
  }

  final LocalizedTextModel? pageTitle;
  final LocalizedTextModel? pageDescription;
  final LocalizedTextModel? roleListTitle;
  final List<RoleDefinitionModel>? roles;
}

class RoleDefinitionModel {
  const RoleDefinitionModel({
    this.roleId,
    this.name,
    this.description,
    this.style,
    this.permissions,
  });

  factory RoleDefinitionModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> permissionsJson =
        json['permissions'] as List<dynamic>? ?? <dynamic>[];

    return RoleDefinitionModel(
      roleId: json['role_id'] as String?,
      name: LocalizedTextModel.fromJson(json['name'] as Map<String, dynamic>?),
      description: LocalizedTextModel.fromJson(
        json['description'] as Map<String, dynamic>?,
      ),
      style: RoleStyleModel.fromJson(json['style'] as Map<String, dynamic>?),
      permissions: permissionsJson
          .whereType<Map<String, dynamic>>()
          .map(PermissionModel.fromJson)
          .toList(),
    );
  }

  final String? roleId;
  final LocalizedTextModel? name;
  final LocalizedTextModel? description;
  final RoleStyleModel? style;
  final List<PermissionModel>? permissions;
}

class RoleStyleModel {
  const RoleStyleModel({this.highlightColor, this.fontWeight});

  factory RoleStyleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const RoleStyleModel();
    }

    return RoleStyleModel(
      highlightColor: json['highlightColor'] as String?,
      fontWeight: json['fontWeight'] as String?,
    );
  }

  final String? highlightColor;
  final String? fontWeight;
}

class PermissionModel {
  const PermissionModel({this.key, this.name, this.description});

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      key: json['key'] as String?,
      name: LocalizedTextModel.fromJson(json['name'] as Map<String, dynamic>?),
      description: LocalizedTextModel.fromJson(
        json['description'] as Map<String, dynamic>?,
      ),
    );
  }

  final String? key;
  final LocalizedTextModel? name;
  final LocalizedTextModel? description;
}

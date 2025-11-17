class LocalizedText {
  const LocalizedText({
    this.en,
    this.ar,
  });

  final String? en;
  final String? ar;
}

class PermissionEntity {
  const PermissionEntity({
    this.key,
    this.name,
    this.description,
  });

  final String? key;
  final LocalizedText? name;
  final LocalizedText? description;
}

class RoleDefinitionEntity {
  const RoleDefinitionEntity({
    this.roleId,
    this.name,
    this.description,
    this.highlightColor,
    this.fontWeight,
    this.permissions,
  });

  final String? roleId;
  final LocalizedText? name;
  final LocalizedText? description;
  final String? highlightColor;
  final String? fontWeight;
  final List<PermissionEntity>? permissions;
}

class SecurityRolesConfigEntity {
  const SecurityRolesConfigEntity({
    this.pageTitle,
    this.pageDescription,
    this.roleListTitle,
    this.roles,
  });

  final LocalizedText? pageTitle;
  final LocalizedText? pageDescription;
  final LocalizedText? roleListTitle;
  final List<RoleDefinitionEntity>? roles;
}



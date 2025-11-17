sealed class ProfileMainEvent {}

class GetLoggedUserDataEvent extends ProfileMainEvent {}

class GetSecurityRolesConfigEvent extends ProfileMainEvent {}

class GetPrivacyPolicyEvent extends ProfileMainEvent {}

class GetHelpContentEvent extends ProfileMainEvent {}

class LogoutEvent extends ProfileMainEvent {}

import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';

class ProfileMainState {
  ProfileMainState({
    this.isLoading = true,
    this.failure,
    this.loggedUserDataResponseEntity,
    this.securityRolesConfig,
    this.privacyPolicy,
    this.helpContent,
    this.isLoggedOut = false,
  });

  final bool isLoading;
  final Failure? failure;
  final LoggedUserDataResponseEntity? loggedUserDataResponseEntity;
  final SecurityRolesConfigEntity? securityRolesConfig;
  final PrivacyPolicyEntity? privacyPolicy;
  final HelpContentEntity? helpContent;
  final bool isLoggedOut;

  ProfileMainState copyWith({
    bool? isLoading,
    Failure? failure,
    LoggedUserDataResponseEntity? loggedUserDataResponseEntity,
    SecurityRolesConfigEntity? securityRolesConfig,
    PrivacyPolicyEntity? privacyPolicy,
    HelpContentEntity? helpContent,
    bool? isLoggedOut,
    bool clearLoggedUserData = false,
  }) {
    return ProfileMainState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
      loggedUserDataResponseEntity: clearLoggedUserData
          ? null
          : (loggedUserDataResponseEntity ?? this.loggedUserDataResponseEntity),
      securityRolesConfig: securityRolesConfig ?? this.securityRolesConfig,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      helpContent: helpContent ?? this.helpContent,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
    );
  }
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/useCases/logout_use_case.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';
import 'package:fitness_app/features/profileMain/domain/useCases/get_help_content_use_case.dart';
import 'package:fitness_app/features/profileMain/domain/useCases/get_logged_user_use_case.dart';
import 'package:fitness_app/features/profileMain/domain/useCases/get_privacy_policy_use_case.dart';
import 'package:fitness_app/features/profileMain/domain/useCases/get_security_roles_config_use_case.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_event.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileMainViewModel extends Cubit<ProfileMainState> {
  ProfileMainViewModel(
    this._getLoggedUserUseCase,
    this._getSecurityRolesConfigUseCase,
    this._getPrivacyPolicyUseCase,
    this._getHelpContentUseCase,
    this._logoutUseCase,
  ) : super(ProfileMainState());

  final GetLoggedUserUseCase _getLoggedUserUseCase;
  final GetSecurityRolesConfigUseCase _getSecurityRolesConfigUseCase;
  final GetPrivacyPolicyUseCase _getPrivacyPolicyUseCase;
  final GetHelpContentUseCase _getHelpContentUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> doIntend(ProfileMainEvent event) async {
    switch (event) {
      case GetLoggedUserDataEvent():
        await _getLoggedUserData();
      case GetSecurityRolesConfigEvent():
        await _getSecurityRolesConfig();
      case GetPrivacyPolicyEvent():
        await _getPrivacyPolicy();
      case GetHelpContentEvent():
        await _getHelpContent();
      case LogoutEvent():
        await _logout();
    }
  }

  Future<void> _getLoggedUserData() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getLoggedUserUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<LoggedUserDataResponseEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            loggedUserDataResponseEntity: result.data,
          ),
        );
        break;
      case ApiErrorResult<LoggedUserDataResponseEntity>():
        emit(state.copyWith(isLoading: false, failure: result.failure));
        break;
    }
  }

  Future<void> _getSecurityRolesConfig() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getSecurityRolesConfigUseCase.invoke();
    emit(state.copyWith(isLoading: false, securityRolesConfig: result));
  }

  Future<void> _getPrivacyPolicy() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getPrivacyPolicyUseCase.invoke();
    emit(state.copyWith(isLoading: false, privacyPolicy: result));
  }

  Future<void> _getHelpContent() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getHelpContentUseCase.invoke();
    emit(state.copyWith(isLoading: false, helpContent: result));
  }

  Future<void> _logout() async {
    emit(state.copyWith(isLoading: true));
    final result = await _logoutUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<void>():
        emit(
          state.copyWith(
            isLoading: false,
            isLoggedOut: true,
            clearLoggedUserData: true,
          ),
        );
        break;
      case ApiErrorResult<void>():
        emit(state.copyWith(isLoading: false, failure: result.failure));
        break;
    }
  }
}

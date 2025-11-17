import 'dart:io';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_event.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_state.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/features/profileMain/domain/useCases/get_logged_user_use_case.dart';
import 'package:fitness_app/features/editProfile/domain/useCases/edit_profile_use_case.dart';
import 'package:fitness_app/features/editProfile/domain/useCases/upload_photo_use_case.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';
import 'package:fitness_app/core/enum/activity_lvl_enum.dart';
import 'package:fitness_app/core/enum/goal_enum.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  EditProfileViewModel(
      this._getLoggedUserUseCase,
      this._editProfileUseCase,
      this._uploadPhotoUseCase,
      ) : super(const EditProfileState()) {
    _addListeners();
  }

  final GetLoggedUserUseCase _getLoggedUserUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  final TextEditingController editProfileFirstNameController =
  TextEditingController();
  final TextEditingController editProfileLastNameController =
  TextEditingController();
  final TextEditingController editProfileEmailController =
  TextEditingController();
  final TextEditingController editProfileWeightController =
  TextEditingController();
  final TextEditingController editProfileGoalController =
  TextEditingController();
  final TextEditingController editProfileActivityLevelController =
  TextEditingController();

  final ValueNotifier<String> goalDisplayNotifier = ValueNotifier('');
  final ValueNotifier<String> activityLevelDisplayNotifier = ValueNotifier('');

  GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  File? selectedImageFile;
  String? initialImage;

  Future<void> doIntend(EditProfileEvent event) async {
    switch (event) {
      case GetLoggedUserDataEvent():
        await _getLoggedUserData();
      case EditProfileSubmitEvent():
        await _updateProfileWithOptionalImage(event.requestEntity);
      case OnImageSelectedEvent():
        _onImageSelected(event.file);
        break;
    }
  }

  Future<void> _getLoggedUserData() async {
    emit(state.copyWith(isGetUserLoading: true));
    final result = await _getLoggedUserUseCase.invoke();

    switch (result) {
      case ApiSuccessResult<LoggedUserDataResponseEntity>():
        final response = result.data;
        _onUserDataLoaded(response);
        emit(
          state.copyWith(
            isGetUserLoading: false,
            loggedUserData: response,
            isDataChanged: false,
            selectedImage: null,
          ),
        );

      case ApiErrorResult<LoggedUserDataResponseEntity>():
        emit(
          state.copyWith(
            isGetUserLoading: false,
            getUserFailure: result.failure,
          ),
        );
    }
  }

  void _onUserDataLoaded(LoggedUserDataResponseEntity response) {
    final user = response.user;
    _removeListeners();

    editProfileFirstNameController.text = user?.firstName ?? '';
    editProfileLastNameController.text = user?.lastName ?? '';
    editProfileEmailController.text = user?.email ?? '';
    editProfileWeightController.text = user?.weight?.toString() ?? '';

    final String goalApiValue = user?.goal ?? GoalEnum.loseWeight.apiValue;
    final String activityApiValue =
        user?.activityLevel ?? ActivityLevel.rookie.apiValue;

    editProfileGoalController.text = goalApiValue;
    editProfileActivityLevelController.text = activityApiValue;

    goalDisplayNotifier.value =
        GoalEnumExtension.fromApiValue(goalApiValue).displayName;
    activityLevelDisplayNotifier.value =
        ActivityLevelExtension.fromApiValue(activityApiValue).displayName;

    initialImage = user?.photo;
    selectedImageFile = null;

    _addListeners();
  }

  Future<void> _updateProfileWithOptionalImage(
      EditProfileRequestEntity requestEntity,
      ) async {
    if (!_isFormValid()) return;

    emit(state.copyWith(isEditProfileLoading: true, editProfileFailure: null));

    final uploadSuccess = await _handleImageUploadIfNeeded();
    if (!uploadSuccess) {
      emit(state.copyWith(isEditProfileLoading: false));
      return;
    }

    await _updateProfileData(requestEntity);
  }

  Future<bool> _handleImageUploadIfNeeded() async {
    if (selectedImageFile == null) return true;

    emit(state.copyWith(isUploadPhotoLoading: true, uploadPhotoFailure: null));

    final uploadResult = await _uploadPhotoUseCase.invoke(selectedImageFile!);
    switch (uploadResult) {
      case ApiErrorResult<UploadPhotoResponseEntity>():
        emit(
          state.copyWith(
            isUploadPhotoLoading: false,
            uploadPhotoFailure: uploadResult.failure,
          ),
        );
        return false;

      case ApiSuccessResult<UploadPhotoResponseEntity>():
        emit(
          state.copyWith(
            isUploadPhotoLoading: false,
            uploadPhotoResponse: uploadResult.data,
          ),
        );
        return true;
    }
  }

  Future<void> _updateProfileData(
      EditProfileRequestEntity requestEntity,
      ) async {
    final result = await _editProfileUseCase.invoke(
      requestEntity: requestEntity,
    );

    switch (result) {
      case ApiSuccessResult<EditProfileResponseEntity>():
        emit(
          state.copyWith(
            isEditProfileLoading: false,
            editProfileResponse: result.data,
            editProfileFailure: null,
            isDataChanged: false,
            selectedImage: null,
          ),
        );
        break;

      case ApiErrorResult<EditProfileResponseEntity>():
        emit(
          state.copyWith(
            isEditProfileLoading: false,
            editProfileFailure: result.failure,
          ),
        );
        break;
    }
  }

  void _onImageSelected(File file) {
    selectedImageFile = file;
    emit(state.copyWith(selectedImage: file));
    _onDataChanged();
  }

  void _onDataChanged() {
    final initialUser = state.loggedUserData?.user;
    if (initialUser == null) return;

    final isChanged = editProfileFirstNameController.text.trim() !=
        (initialUser.firstName ?? '').trim() ||
        editProfileLastNameController.text.trim() !=
            (initialUser.lastName ?? '').trim() ||
        editProfileEmailController.text.trim() !=
            (initialUser.email ?? '').trim() ||
        editProfileWeightController.text.trim() !=
            (initialUser.weight?.toString() ?? '').trim() ||
        editProfileGoalController.text.trim() !=
            (initialUser.goal ?? '').trim() ||
        editProfileActivityLevelController.text.trim() !=
            (initialUser.activityLevel ?? '').trim() ||
        selectedImageFile != null;

    if (isChanged != state.isDataChanged) {
      emit(state.copyWith(isDataChanged: isChanged));
    }
  }

  void _addListeners() {
    editProfileFirstNameController.addListener(_onDataChanged);
    editProfileLastNameController.addListener(_onDataChanged);
    editProfileEmailController.addListener(_onDataChanged);
    editProfileWeightController.addListener(_onDataChanged);
    editProfileGoalController.addListener(_onDataChanged);
    editProfileActivityLevelController.addListener(_onDataChanged);
  }

  void _removeListeners() {
    editProfileFirstNameController.removeListener(_onDataChanged);
    editProfileLastNameController.removeListener(_onDataChanged);
    editProfileEmailController.removeListener(_onDataChanged);
    editProfileWeightController.removeListener(_onDataChanged);
    editProfileGoalController.removeListener(_onDataChanged);
    editProfileActivityLevelController.removeListener(_onDataChanged);
  }

  bool _isFormValid() {
    return editProfileFormKey.currentState?.validate() ?? false;
  }

  @override
  Future<void> close() {
    _removeListeners();
    editProfileFirstNameController.dispose();
    editProfileLastNameController.dispose();
    editProfileEmailController.dispose();
    editProfileWeightController.dispose();
    editProfileGoalController.dispose();
    editProfileActivityLevelController.dispose();
    goalDisplayNotifier.dispose();
    activityLevelDisplayNotifier.dispose();
    return super.close();
  }
}
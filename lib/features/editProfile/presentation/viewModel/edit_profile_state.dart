import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/upload_photo_response_entity.dart';
import 'package:fitness_app/features/profileMain/domain/entities/response/logged_user_data_response_entity.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.isGetUserLoading = false,
    this.getUserFailure,
    this.loggedUserData,
    this.isEditProfileLoading = false,
    this.editProfileFailure,
    this.editProfileResponse,
    this.isUploadPhotoLoading = false,
    this.uploadPhotoFailure,
    this.uploadPhotoResponse,
    this.selectedImage,
    this.isDataChanged = false,
  });

  final bool isGetUserLoading;
  final Failure? getUserFailure;
  final LoggedUserDataResponseEntity? loggedUserData;

  final bool isEditProfileLoading;
  final Failure? editProfileFailure;
  final EditProfileResponseEntity? editProfileResponse;

  final bool isUploadPhotoLoading;
  final Failure? uploadPhotoFailure;
  final UploadPhotoResponseEntity? uploadPhotoResponse;

  final File? selectedImage;
  final bool isDataChanged;

  @override
  List<Object?> get props => [
    isGetUserLoading,
    getUserFailure,
    loggedUserData,
    isEditProfileLoading,
    editProfileFailure,
    editProfileResponse,
    isUploadPhotoLoading,
    uploadPhotoFailure,
    uploadPhotoResponse,
    selectedImage,
    isDataChanged,
  ];

  EditProfileState copyWith({
    bool? isGetUserLoading,
    Failure? getUserFailure,
    LoggedUserDataResponseEntity? loggedUserData,
    bool? isEditProfileLoading,
    Failure? editProfileFailure,
    EditProfileResponseEntity? editProfileResponse,
    bool? isUploadPhotoLoading,
    Failure? uploadPhotoFailure,
    UploadPhotoResponseEntity? uploadPhotoResponse,
    File? selectedImage,
    bool? isDataChanged,
  }) {
    return EditProfileState(
      isGetUserLoading: isGetUserLoading ?? this.isGetUserLoading,
      getUserFailure: getUserFailure ?? this.getUserFailure,
      loggedUserData: loggedUserData ?? this.loggedUserData,
      isEditProfileLoading: isEditProfileLoading ?? this.isEditProfileLoading,
      editProfileFailure: editProfileFailure ?? this.editProfileFailure,
      editProfileResponse: editProfileResponse ?? this.editProfileResponse,
      isUploadPhotoLoading: isUploadPhotoLoading ?? this.isUploadPhotoLoading,
      uploadPhotoFailure: uploadPhotoFailure ?? this.uploadPhotoFailure,
      uploadPhotoResponse: uploadPhotoResponse ?? this.uploadPhotoResponse,
      selectedImage: selectedImage ?? this.selectedImage,
      isDataChanged: isDataChanged ?? this.isDataChanged,
    );
  }
}

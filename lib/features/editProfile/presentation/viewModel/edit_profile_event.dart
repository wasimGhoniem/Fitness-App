import 'dart:io';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';

sealed class EditProfileEvent {}

class EditProfileSubmitEvent extends EditProfileEvent {
  EditProfileSubmitEvent({required this.requestEntity});

  final EditProfileRequestEntity requestEntity;
}

class GetLoggedUserDataEvent extends EditProfileEvent {}

class OnImageSelectedEvent extends EditProfileEvent {
  OnImageSelectedEvent({required this.file});

  final File file;
}

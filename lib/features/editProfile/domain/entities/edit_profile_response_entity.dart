import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_user_entity.dart';

class EditProfileResponseEntity {
  const EditProfileResponseEntity({this.message, this.user});

  final String? message;
  final EditProfileUserEntity? user;
}

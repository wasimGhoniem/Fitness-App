import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';

class ProfileDataResponseEntity {
  ProfileDataResponseEntity({required this.message, required this.profile});

  final String message;
  final ProfileEntity profile;
}

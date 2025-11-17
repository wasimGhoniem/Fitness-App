import 'package:fitness_app/features/profileMain/domain/entities/logged_user_entity.dart';

class LoggedUserDataResponseEntity {
  const LoggedUserDataResponseEntity({this.message, this.user});

  final String? message;
  final LoggedUserEntity? user;
}

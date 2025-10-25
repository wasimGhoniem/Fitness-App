import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_user_entity.dart';

class SignInResponseEntity {
  SignInResponseEntity({this.message, this.user, this.token});

  final String? message;
  final SignInUserEntity? user;
  final String? token;
}

import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';

sealed class SignInEvent {}

class SignInActionEvent extends SignInEvent {
  SignInActionEvent({required this.request});

  final SignInRequestEntity request;
}

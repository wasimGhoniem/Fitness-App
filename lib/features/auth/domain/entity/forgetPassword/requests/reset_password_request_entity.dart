import 'package:equatable/equatable.dart';

class ResetPasswordRequestEntity extends Equatable {

  ResetPasswordRequestEntity ({
    this.email,
    this.newPassword,
  });
  final String? email;
  final String? newPassword;

  @override
  List<Object?> get props => [email, newPassword];
}
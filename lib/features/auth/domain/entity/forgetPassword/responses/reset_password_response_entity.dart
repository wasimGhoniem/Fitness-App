import 'package:equatable/equatable.dart';

class ResetPasswordResponseEntity extends Equatable {
  final String? message;
  final String? token;

  ResetPasswordResponseEntity ({
    this.message,
    this.token,
  });

  @override
  List<Object?> get props => [message, token];
}
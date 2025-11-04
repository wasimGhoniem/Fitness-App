import 'package:equatable/equatable.dart';

class ForgetPasswordRequestEntity extends Equatable {
  final String? email;

  ForgetPasswordRequestEntity ({
    this.email,
  });

  @override
  List<Object?> get props => [email];
}
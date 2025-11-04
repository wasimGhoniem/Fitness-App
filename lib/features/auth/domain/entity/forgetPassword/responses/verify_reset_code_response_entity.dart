import 'package:equatable/equatable.dart';

class VerifyResetCodeResponseEntity extends Equatable {
  final String? status;

  VerifyResetCodeResponseEntity ({
    this.status,
  });

  @override
  List<Object?> get props => [status];
}
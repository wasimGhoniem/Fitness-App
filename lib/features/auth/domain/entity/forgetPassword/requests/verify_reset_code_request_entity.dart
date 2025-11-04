import 'package:equatable/equatable.dart';

class VerifyResetCodeRequestEntity extends Equatable {

  VerifyResetCodeRequestEntity ({
    this.resetCode,
  });
  final String? resetCode;

  @override
  List<Object?> get props => [resetCode];
}
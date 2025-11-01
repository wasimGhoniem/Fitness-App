import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';

sealed class SignUpEvents {}

class SignUpEvent extends SignUpEvents {
  SignUpEvent({required this.signUpReqModel});
  final SignUpReqModel signUpReqModel;
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<void>> signUp(SignUpReqModel signUpReqModel);
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';

abstract interface class AuthRepo {
  Future<ApiResult<SignInResponseEntity>> signIn({
    required SignInRequestEntity request,
  });

  Future<ApiResult<void>> signUp(SignUpReqModel signUpReqModel);
}

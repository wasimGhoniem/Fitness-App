import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/api/model/signUp/request/sign_up_req_model.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpUseCase(this._authRepo);
  final AuthRepo _authRepo;
  Future<ApiResult<void>> invoke({
    required SignUpReqModel signUpReqModel,
  }) async {
    return await _authRepo.signUp(signUpReqModel);
  }
}

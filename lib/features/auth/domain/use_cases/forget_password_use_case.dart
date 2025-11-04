import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordUseCase(this._authRepo);
  final AuthRepo _authRepo;

  Future<ApiResult<ForgetPasswordResponseEntity>> invoke({
    required ForgetPasswordRequestEntity request
  }) {
    return _authRepo.forgetPassword(request);
  }
}
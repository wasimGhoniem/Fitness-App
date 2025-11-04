import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordUseCase(this._authRepo);
  final AuthRepo _authRepo;

  Future<ApiResult<ResetPasswordResponseEntity>> invoke({
    required ResetPasswordRequestEntity request,
  }) {
    return _authRepo.resetPassword(request);
  }
}
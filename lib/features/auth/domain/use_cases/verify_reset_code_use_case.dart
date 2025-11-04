import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/requests/verify_reset_code_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/forgetPassword/responses/verify_reset_code_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  VerifyResetCodeUseCase(this._authRepo);
  final AuthRepo _authRepo;

  Future<ApiResult<VerifyResetCodeResponseEntity>> invoke({
    required VerifyResetCodeRequestEntity resetCode,
  }) {
    return _authRepo.verifyResetCode(resetCode);
  }
}
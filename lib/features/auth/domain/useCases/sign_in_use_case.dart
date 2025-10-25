import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  SignInUseCase(this._authRepo);

  final AuthRepo _authRepo;

  Future<ApiResult<SignInResponseEntity>> invoke(SignInRequestEntity request) {
    return _authRepo.signIn(request: request);
  }
}

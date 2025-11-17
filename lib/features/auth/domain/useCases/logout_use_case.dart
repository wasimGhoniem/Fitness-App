import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  LogoutUseCase(this._authRepo);

  final AuthRepo _authRepo;

  Future<ApiResult<void>> invoke() {
    return _authRepo.deleteToken();
  }
}

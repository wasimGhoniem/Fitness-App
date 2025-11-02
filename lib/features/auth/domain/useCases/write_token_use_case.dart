import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class WriteTokenUseCase {
  WriteTokenUseCase(this._resetPasswordRepo);

  final AuthRepo _resetPasswordRepo;

  Future<ApiResult<void>> invoke({required String token}) {
    return _resetPasswordRepo.writeToken(token: token);
  }
}

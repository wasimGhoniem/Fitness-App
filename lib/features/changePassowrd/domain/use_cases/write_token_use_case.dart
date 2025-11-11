import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/changePassowrd/domain/repositories/chnage_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class WriteTokenUseCase {
  WriteTokenUseCase(this._changePasswordRepo);

  final ChangePasswordRepo _changePasswordRepo;
  Future<ApiResult<void>> invoke({required String token}) {
    return _changePasswordRepo.writeToken(token: token);
  }
}

import 'package:fitness_app/features/profileMain/domain/entities/privacy_policy_entity.dart';
import 'package:fitness_app/features/profileMain/domain/repositories/profile_main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPrivacyPolicyUseCase {
  GetPrivacyPolicyUseCase(this._profileRepo);

  final ProfileMainRepo _profileRepo;

  Future<PrivacyPolicyEntity> invoke() {
    return _profileRepo.getPrivacyPolicy();
  }
}


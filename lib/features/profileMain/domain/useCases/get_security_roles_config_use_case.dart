import 'package:fitness_app/features/profileMain/domain/entities/security_roles_config_entity.dart';
import 'package:fitness_app/features/profileMain/domain/repositories/profile_main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSecurityRolesConfigUseCase {
  GetSecurityRolesConfigUseCase(this._profileRepo);

  final ProfileMainRepo _profileRepo;

  Future<SecurityRolesConfigEntity> invoke() {
    return _profileRepo.getSecurityRolesConfig();
  }
}

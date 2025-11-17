import 'package:fitness_app/features/profileMain/domain/entities/help_entity.dart';
import 'package:fitness_app/features/profileMain/domain/repositories/profile_main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHelpContentUseCase {
  GetHelpContentUseCase(this._profileRepo);

  final ProfileMainRepo _profileRepo;

  Future<HelpContentEntity> invoke() {
    return _profileRepo.getHelpContent();
  }
}


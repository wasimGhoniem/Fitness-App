import 'package:fitness_app/features/on_boarding/domain/repo/on_boarding_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CacheOnBoardingUseCase {
  CacheOnBoardingUseCase(this._onBoardingRepo);

  final OnBoardingRepo _onBoardingRepo;

  Future<void> call({required String key, required String value}) {
    return _onBoardingRepo.cacheOnBoarding(key: key, value: value);
  }
}

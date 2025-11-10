import 'package:fitness_app/features/on_boarding/data/dataSources/on_boarding_local_data_source.dart';
import 'package:fitness_app/features/on_boarding/domain/repo/on_boarding_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OnBoardingRepo)
class OnBoardingRepoImpl implements OnBoardingRepo {
  OnBoardingRepoImpl(this._onBoardingLocalDataSource);

  final OnBoardingLocalDataSource _onBoardingLocalDataSource;

  @override
  Future<void> cacheOnBoarding({required String key, required String value}) {
    return _onBoardingLocalDataSource.cacheOnBoarding(key: key, value: value);
  }
}

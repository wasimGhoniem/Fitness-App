import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/on_boarding/data/dataSources/on_boarding_local_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OnBoardingLocalDataSource)
class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  OnBoardingLocalDataSourceImpl(
    @Named(AppConstants.secureStorage) this._storage,
  );

  final Storage _storage;

  @override
  Future<void> cacheOnBoarding({required String key, required String value}) {
    return _storage.write(key: key, value: value);
  }
}

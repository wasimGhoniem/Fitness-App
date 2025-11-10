abstract interface class OnBoardingLocalDataSource {
  Future<void> cacheOnBoarding({required String key, required String value});
}

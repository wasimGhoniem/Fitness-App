abstract interface class OnBoardingRepo {
  Future<void> cacheOnBoarding({required String key, required String value});
}

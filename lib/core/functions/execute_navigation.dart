import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';

Future<String> getInitialRoute() async {
  final storage = getIt<Storage>(instanceName: AppConstants.secureStorage);

  final isOnBoardingSeen = await storage.read(
    key: AppConstants.isEnboardingSeen,
  );
  final isLoggedIn = await storage.read(key: AppConstants.token);

  if (isOnBoardingSeen == 'true' && isLoggedIn.isNotEmpty) {
    return AppRoutes.mainLayoutRoute;
  } else if (isOnBoardingSeen == 'true' && isLoggedIn.isEmpty) {
    return AppRoutes.signInRoute;
  }

  return AppRoutes.onBoardingRoute;
}

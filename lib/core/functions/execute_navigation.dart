import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';

Future<String> getInitialRoute() async {
  final storage = getIt<Storage>(instanceName: AppConstants.secureStorage);
  final isOnBoardingSeen = await storage.read(
    key: AppConstants.isEnboardingSeen,
  );

  if (isOnBoardingSeen.toLowerCase() == 'true') {
    return AppRoutes.signInRoute;
  }
  return AppRoutes.onBoardingRoute;
}

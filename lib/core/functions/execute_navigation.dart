import 'package:fitness_app/core/config/routing/app_routes.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';

Future<String> getInitialRoute() async {
  final storage = getIt<Storage>(instanceName: AppConstants.secureStorage);
  final rememberMeValue = await storage.read(key: AppConstants.rememberMe);

  if (rememberMeValue.toLowerCase() == 'true') {
    return AppRoutes.mainLayoutRoute;
  }
  return AppRoutes.signInRoute;
}

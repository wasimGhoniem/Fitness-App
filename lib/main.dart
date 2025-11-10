import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/core/config/routing/route_generator.dart';
import 'package:fitness_app/core/config/theme/app_theme.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/functions/execute_navigation.dart';
import 'package:fitness_app/core/helpers/app_config_cubit.dart';
import 'package:fitness_app/core/helpers/block_observer.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await dotenv.load(fileName: AppConstants.envKey);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  final initialRoute = await getInitialRoute();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: AppConstants.supportedLocales,
      path: AppConstants.assetsPath,
      fallbackLocale: const Locale(AppConstants.en),
      child: FitnessApp(initialRoute: initialRoute),
    ),
  );
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppConfigCubit>()..loadSavedLocale(),
      child: BlocBuilder<AppConfigCubit, Locale>(
        builder: (context, localeState) {
          return ResponsiveBreakpoints.builder(
            breakpoints: AppSizes.appBreakPoints,
            breakpointsLandscape: AppSizes.appLandscapeBreakPoints,
            child: MaterialApp(
              initialRoute: initialRoute,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: localeState,
              theme: AppThemeLight.lightTheme,
              onGenerateRoute: RouteGenerator.getRoute,
              builder: (context, child) => ResponsiveScaledBox(
                width: ResponsiveValue<double>(
                  context,
                  conditionalValues: AppSizes.conditionalValues,
                ).value,
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }
}

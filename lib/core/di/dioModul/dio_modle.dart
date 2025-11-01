import 'package:dio/dio.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/services/storage_interface.dart';
import 'package:fitness_app/core/utils/constants/api_constants.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(requestHeader: true, requestBody: true);
  }

  @lazySingleton
  @Named(ApiConstants.fitnessDio)
  Dio provideFitnessDio() {
    final Dio dio = Dio();
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers = {
      ApiConstants.contentType: ApiConstants.applicationJson,
    };
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String token = await getIt
              .get<Storage>(instanceName: AppConstants.secureStorage)
              .read(key: ApiConstants.token);
          if (token.isNotEmpty) {
            options.headers[ApiConstants.authorization] =
                '${ApiConstants.bearer} $token';
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  @lazySingleton
  @Named(ApiConstants.mealsDio)
  Dio provideMealsDio() {
    final Dio dio = Dio();
    dio.options.baseUrl = ApiConstants.mealsBaseUrl;
    dio.options.headers = {
      ApiConstants.contentType: ApiConstants.applicationJson,
    };
    dio.interceptors.add(getIt.get<PrettyDioLogger>());

    return dio;
  }
}

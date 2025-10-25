import 'package:fitness_app/core/classes/remote_executor.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:fitness_app/features/auth/api/client/auth_api_service.dart';
import 'package:fitness_app/features/auth/api/mapper/signIn/sign_in_request_mapper.dart';
import 'package:fitness_app/features/auth/api/mapper/signIn/sign_in_response_mapper.dart';
import 'package:fitness_app/features/auth/api/model/signIn/response/sign_in_response_dto.dart';
import 'package:fitness_app/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entity/signIn/sign_in_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(
    this._apiServices,
    @Named(AppConstants.apiRemoteExecutor) this._apiRemoteExecutor,
  );

  final AuthApiService _apiServices;

  final ApiRemoteExecutor _apiRemoteExecutor;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn({
    required SignInRequestEntity request,
  }) {
    return _apiRemoteExecutor.execute<SignInResponseDto, SignInResponseEntity>(
      request: () => _apiServices.signIn(request: request.toDto()),
      mapper: (response) => response.toEntity(),
    );
  }
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_request_entity.dart';
import 'package:fitness_app/features/editProfile/domain/entities/edit_profile_response_entity.dart';
import 'package:fitness_app/features/editProfile/domain/repositories/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProfileUseCase {
  EditProfileUseCase(this._repository);

  final EditProfileRepository _repository;

  Future<ApiResult<EditProfileResponseEntity>> invoke({
    required EditProfileRequestEntity requestEntity,
  }) {
    return _repository.editProfile(requestEntity: requestEntity);
  }
}

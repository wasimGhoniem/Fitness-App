import 'dart:typed_data';
import 'package:fitness_app/core/aiLayer/domain/repositories/ai_repo.dart';
import 'package:fitness_app/core/enum/ai_service_enum.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:injectable/injectable.dart';

@injectable
class ValidateDataUseCase {
  ValidateDataUseCase(this._aiRepository);

  final AiRepository _aiRepository;

  Future<ApiResult<String>> invoke({
    AiProvider? aiProvider,
    required String prompt,
    required Uint8List data,
    required String dataType,
  }) async {
    return await _aiRepository.validateData(prompt, data, dataType, aiProvider);
  }
}

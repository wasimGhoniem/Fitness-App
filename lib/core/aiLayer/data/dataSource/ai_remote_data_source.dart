import 'dart:typed_data';
import 'package:fitness_app/core/errors/api_results.dart';

abstract class AiRemoteDataSource {
  Future<ApiResult<String>> generateText(String prompt);

  Future<ApiResult<String>> validateData(
    String prompt,
    Uint8List data,
    String dataType,
  );
}

import 'package:fitness_app/core/aiLayer/data/dataSource/ai_remote_data_source.dart';
import 'package:fitness_app/core/enum/ai_service_enum.dart';
import 'package:fitness_app/core/utils/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class AiDataSourceFactory {
  AiDataSourceFactory(@Named(AppConstants.gemini) this._gemini);

  final AiRemoteDataSource _gemini;

  AiRemoteDataSource create(AiProvider? aiProvider) {
    switch (aiProvider) {
      case AiProvider.gemini:
        return _gemini;
      default:
        return _gemini;
    }
  }
}

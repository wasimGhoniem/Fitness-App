import 'package:fitness_app/features/exercise/api/models/exercise_dto.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercise_entity.dart';

extension ExerciseMapper on ExerciseDto {
  ExerciseEntity toEntity() {
    return ExerciseEntity(
      id: id ?? '',
      name: name ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      videoUrl: videoUrl ?? '',
      sets: sets ?? 0,
      reps: reps ?? 0,
      duration: duration ?? 0,
    );
  }
}

extension ExerciseListMapper on List<ExerciseDto> {
  List<ExerciseEntity> toEntity() {
    return map((dto) => dto.toEntity()).toList();
  }
}

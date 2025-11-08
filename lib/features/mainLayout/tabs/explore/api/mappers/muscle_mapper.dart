import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';

extension MuscleEntityMapper on MusclesResponseDto {
  MuscleResponseEntity toEntity() {
    return MuscleResponseEntity(
      message: message ?? '',
      totalMuscles: totalMuscles ?? 0,
      muscles: muscles?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension MuscleMapper on MuscleDto {
  MuscleEntity toEntity() {
    return MuscleEntity(
      id: id ?? '',
      name: name ?? '',
      image:
          image ??
          'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
    );
  }
}

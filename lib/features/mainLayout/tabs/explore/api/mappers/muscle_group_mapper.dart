import 'package:fitness_app/features/mainLayout/tabs/explore/api/mappers/muscle_mapper.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_details_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscle_group_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/api/models/muscles_groups_response_dto.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';

extension MusclesGroupsResponseMapper on MusclesGroupsResponseDto {
  MusclesGroupsResponseEntity toEntity() {
    return MusclesGroupsResponseEntity(
      message: message ?? '',
      musclesGroup:
          musclesGroup?.map((e) => e.toEntity()).toList(growable: false) ?? [],
    );
  }
}

extension MuscleGroupMapper on MuscleGroupDto {
  MuscleGroupEntity toEntity() {
    return MuscleGroupEntity(id: id ?? '', name: name ?? '');
  }
}

extension MuscleGroupDetailsResponseMapper on MuscleGroupDetailsResponseDto {
  MuscleGroupDetailsResponseEntity toEntity() {
    return MuscleGroupDetailsResponseEntity(
      message: message ?? '',
      muscleGroup: (muscleGroup ?? MuscleGroupDto()).toEntity(),
      muscles: (muscles ?? const [])
          .map((m) => m.toEntity())
          .toList(growable: false),
    );
  }
}

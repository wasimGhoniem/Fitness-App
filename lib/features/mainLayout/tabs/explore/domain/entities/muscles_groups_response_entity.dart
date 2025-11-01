import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';

class MusclesGroupsResponseEntity {
  MusclesGroupsResponseEntity({
    required this.message,
    required this.musclesGroup,
  });

  final String message;
  final List<MuscleGroupEntity> musclesGroup;
}

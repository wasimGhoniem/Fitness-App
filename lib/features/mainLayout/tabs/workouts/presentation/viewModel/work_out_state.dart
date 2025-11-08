import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';

class WorkOutState extends Equatable {
  const WorkOutState({
    this.isMusclesbyGroupsIdLoading = true,
    this.isMusclesGroupsLoading = true,
    this.musclesGroupsFailure,
    this.musclesGroupsbyGroupIdFailure,
    this.musclesGroupsResponseEntity,
    this.muscleGroupDetailsResponseEntity,
  });
  final bool isMusclesGroupsLoading;
  final bool isMusclesbyGroupsIdLoading;
  final Failure? musclesGroupsFailure;
  final Failure? musclesGroupsbyGroupIdFailure;
  final MusclesGroupsResponseEntity? musclesGroupsResponseEntity;
  final MuscleGroupDetailsResponseEntity? muscleGroupDetailsResponseEntity;

  WorkOutState copyWith({
    bool? isMusclesGroupsLoading,
    bool? isMusclesbyGroupsIdLoading,
    Failure? musclesGroupsFailure,
    Failure? musclesGroupsbyGroupIdFailure,
    MusclesGroupsResponseEntity? musclesGroupsResponseEntity,
    MuscleGroupDetailsResponseEntity? muscleGroupDetailsResponseEntity,
  }) {
    return WorkOutState(
      isMusclesGroupsLoading:
          isMusclesGroupsLoading ?? this.isMusclesGroupsLoading,
      isMusclesbyGroupsIdLoading:
          isMusclesbyGroupsIdLoading ?? this.isMusclesbyGroupsIdLoading,
      musclesGroupsFailure: musclesGroupsFailure ?? this.musclesGroupsFailure,
      musclesGroupsbyGroupIdFailure:
          musclesGroupsbyGroupIdFailure ?? this.musclesGroupsbyGroupIdFailure,
      musclesGroupsResponseEntity:
          musclesGroupsResponseEntity ?? this.musclesGroupsResponseEntity,
      muscleGroupDetailsResponseEntity:
          muscleGroupDetailsResponseEntity ??
          this.muscleGroupDetailsResponseEntity,
    );
  }

  @override
  List<Object?> get props => [
    isMusclesbyGroupsIdLoading,
    isMusclesGroupsLoading,
    musclesGroupsFailure,
    musclesGroupsbyGroupIdFailure,
    musclesGroupsResponseEntity,
    muscleGroupDetailsResponseEntity,
  ];
}

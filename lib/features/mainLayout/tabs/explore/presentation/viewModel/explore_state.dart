import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failure.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';

class ExploreState extends Equatable {
  const ExploreState({
    this.muscleResponseEntity,
    this.isToMuscleLoading = true,
    this.musclesFailure,
    this.profileDataResponseEntity,
    this.isProfileLoading = true,
    this.profileFailure,
    this.isMusclesGroupsLoading = true,
    this.musclesGroupsFailure,
    this.musclesGroupsResponseEntity,
    this.isMusclesbyGroupsIdLoading = true,
    this.musclesGroupsbyGroupIdFailure,
    this.muscleGroupDetailsResponseEntity,
    this.isCategoriesLoading = true,
    this.categoriesFailure,
    this.categoriesResponse,
  });
  final bool isToMuscleLoading;
  final bool isProfileLoading;
  final bool isMusclesGroupsLoading;
  final bool isMusclesbyGroupsIdLoading;
  final bool isCategoriesLoading;
  final Failure? musclesFailure;
  final Failure? profileFailure;
  final Failure? musclesGroupsFailure;
  final Failure? musclesGroupsbyGroupIdFailure;
  final Failure? categoriesFailure;
  final MuscleResponseEntity? muscleResponseEntity;
  final ProfileDataResponseEntity? profileDataResponseEntity;
  final MusclesGroupsResponseEntity? musclesGroupsResponseEntity;
  final MuscleGroupDetailsResponseEntity? muscleGroupDetailsResponseEntity;
  final MealsCategoriesResponseEntity? categoriesResponse;

  ExploreState copyWith({
    MuscleResponseEntity? muscleResponseEntity,
    ProfileDataResponseEntity? profileDataResponseEntity,
    MusclesGroupsResponseEntity? musclesGroupsResponseEntity,
    MuscleGroupDetailsResponseEntity? muscleGroupDetailsResponseEntity,
    MealsCategoriesResponseEntity? categoriesResponse,
    bool? isToMuscleLoading,
    bool? isProfileLoading,
    bool? isMusclesGroupsLoading,
    bool? isMusclesbyGroupsIdLoading,
    bool? isCategoriesLoading,
    Failure? musclesFailure,
    Failure? profileFailure,
    Failure? musclesGroupsFailure,
    Failure? musclesGroupsbyGroupIdFailure,
    Failure? categoriesFailure,
  }) {
    return ExploreState(
      muscleResponseEntity: muscleResponseEntity ?? this.muscleResponseEntity,
      isToMuscleLoading: isToMuscleLoading ?? this.isToMuscleLoading,
      musclesFailure: musclesFailure ?? this.musclesFailure,
      profileDataResponseEntity:
          profileDataResponseEntity ?? this.profileDataResponseEntity,
      isProfileLoading: isProfileLoading ?? this.isProfileLoading,
      profileFailure: profileFailure ?? this.profileFailure,
      isMusclesGroupsLoading:
          isMusclesGroupsLoading ?? this.isMusclesGroupsLoading,
      musclesGroupsFailure: musclesGroupsFailure ?? this.musclesGroupsFailure,
      musclesGroupsResponseEntity:
          musclesGroupsResponseEntity ?? this.musclesGroupsResponseEntity,
      isMusclesbyGroupsIdLoading:
          isMusclesbyGroupsIdLoading ?? this.isMusclesbyGroupsIdLoading,
      musclesGroupsbyGroupIdFailure:
          musclesGroupsbyGroupIdFailure ?? this.musclesGroupsbyGroupIdFailure,
      muscleGroupDetailsResponseEntity:
          muscleGroupDetailsResponseEntity ??
          this.muscleGroupDetailsResponseEntity,
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      categoriesFailure: categoriesFailure ?? this.categoriesFailure,
      categoriesResponse: categoriesResponse ?? this.categoriesResponse,
    );
  }

  @override
  List<Object?> get props => [
    muscleResponseEntity,
    profileDataResponseEntity,
    isToMuscleLoading,
    isProfileLoading,
    musclesFailure,
    profileFailure,
    isMusclesGroupsLoading,
    musclesGroupsFailure,
    musclesGroupsResponseEntity,
    muscleGroupDetailsResponseEntity,
    isMusclesbyGroupsIdLoading,
    musclesGroupsbyGroupIdFailure,
    isCategoriesLoading,
    categoriesFailure,
    categoriesResponse,
  ];
}

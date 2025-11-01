import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_data_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_by_group_id_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_groups_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_profile_data_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_random_muscles_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_event.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExploreViewModel extends Cubit<ExploreState> {
  ExploreViewModel(
    this.getMusclesByGroupIdUseCase,
    this.getProfileDataUseCase,
    this.getRandomMusclesUseCase,
    this.getMusclesGroupsUseCase,
  ) : super(const ExploreState());

  //!Recommendation to day section
  GetRandomMusclesUseCase getRandomMusclesUseCase;
  //!Upcoming Workouts section
  GetMusclesGroupsUseCase getMusclesGroupsUseCase;
  GetMusclesByGroupIdUseCase getMusclesByGroupIdUseCase;
  //!Profile Data
  GetProfileDataUseCase getProfileDataUseCase;

  void doIntent(ExploreEvents events) {
    switch (events) {
      case GetAllExploreEvent(id: final id):
        _getAllHome(id: id);
      case GetMusclesByGroupIdEvent(id: final id):
        _getMusclesByGroupId(id: id);
    }
  }

  void _getAllHome({required String id}) {
    _getRandomMuscles();
    _getMusclesGroups();
    _getProfileData();
    _getMusclesByGroupId(id: id);
  }

  Future<void> _getRandomMuscles() async {
    final result = await getRandomMusclesUseCase.call();
    switch (result) {
      case ApiSuccessResult<MuscleResponseEntity>():
        emit(
          state.copyWith(
            isToMuscleLoading: false,
            muscleResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<MuscleResponseEntity>():
        emit(
          state.copyWith(
            isToMuscleLoading: false,
            musclesFailure: result.failure,
          ),
        );
    }
  }

  Future<void> _getMusclesGroups() async {
    final result = await getMusclesGroupsUseCase.call();
    switch (result) {
      case ApiSuccessResult<MusclesGroupsResponseEntity>():
        emit(
          state.copyWith(
            isMusclesGroupsLoading: false,
            musclesGroupsResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<MusclesGroupsResponseEntity>():
        emit(
          state.copyWith(
            isMusclesGroupsLoading: false,
            musclesGroupsFailure: result.failure,
          ),
        );
    }
  }

  Future<void> _getMusclesByGroupId({required String id}) async {
    emit(state.copyWith(isMusclesbyGroupsIdLoading: true));
    final result = await getMusclesByGroupIdUseCase.call(groupId: id);
    switch (result) {
      case ApiSuccessResult<MuscleGroupDetailsResponseEntity>():
        emit(
          state.copyWith(
            isMusclesbyGroupsIdLoading: false,
            muscleGroupDetailsResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<MuscleGroupDetailsResponseEntity>():
        emit(
          state.copyWith(
            isMusclesbyGroupsIdLoading: false,
            musclesGroupsbyGroupIdFailure: result.failure,
          ),
        );
    }
  }

  Future<void> _getProfileData() async {
    final result = await getProfileDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<ProfileDataResponseEntity>():
        emit(
          state.copyWith(
            isProfileLoading: false,
            profileDataResponseEntity: result.data,
          ),
        );
      case ApiErrorResult<ProfileDataResponseEntity>():
        emit(
          state.copyWith(
            isProfileLoading: false,
            profileFailure: result.failure,
          ),
        );
    }
  }
}

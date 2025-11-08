import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_details_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscles_groups_response_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_by_group_id_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/useCases/get_muscles_groups_use_case.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/viewModel/work_out_events.dart';
import 'package:fitness_app/features/mainLayout/tabs/workouts/presentation/viewModel/work_out_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WorkOutViewModel extends Cubit<WorkOutState> {
  WorkOutViewModel(
    this._getMusclesGroupsUseCase,
    this._getMusclesByGroupIdUseCase,
  ) : super(const WorkOutState());

  void doIntent({required WorkOutEvents events}) {
    switch (events) {
      case GetAllWorkOuts(id: final id):
        getAllWorkouts(id: id);
        break;
      case GetWorkOutByeId(id: final id):
        _getMusclesByGroupId(id: id);
        break;
    }
  }

  final GetMusclesGroupsUseCase _getMusclesGroupsUseCase;
  final GetMusclesByGroupIdUseCase _getMusclesByGroupIdUseCase;

  void getAllWorkouts({required String id}) {
    _getMusclesGroups();
    _getMusclesByGroupId(id: id);
  }

  Future<void> _getMusclesGroups() async {
    final result = await _getMusclesGroupsUseCase.call();
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
    final result = await _getMusclesByGroupIdUseCase.call(groupId: id);
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
}

import 'package:fitness_app/core/errors/api_results.dart';
import 'package:fitness_app/features/food/domain/entity/meals_categories_response_entity.dart';
import 'package:fitness_app/features/food/domain/useCases/get_meals_categories_use_case.dart';
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
    this._getMusclesByGroupIdUseCase,
    this._getProfileDataUseCase,
    this._getRandomMusclesUseCase,
    this._getMusclesGroupsUseCase,
    this._getMealsCategoriesUseCase,
  ) : super(const ExploreState());

  //!Recommendation to day section
  final GetRandomMusclesUseCase _getRandomMusclesUseCase;
  //!Upcoming Workouts section
  final GetMusclesGroupsUseCase _getMusclesGroupsUseCase;
  final GetMusclesByGroupIdUseCase _getMusclesByGroupIdUseCase;
  //!Profile Data
  final GetProfileDataUseCase _getProfileDataUseCase;
  final GetMealsCategoriesUseCase _getMealsCategoriesUseCase;

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
    _getAllMealCategories();
  }

  Future<void> _getRandomMuscles() async {
    final result = await _getRandomMusclesUseCase.call();
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

  Future<void> _getProfileData() async {
    final result = await _getProfileDataUseCase.call();
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

  Future<void> _getAllMealCategories() async {
    final result = await _getMealsCategoriesUseCase.invoke();

    switch (result) {
      case ApiSuccessResult<MealsCategoriesResponseEntity>():
        emit(
          state.copyWith(
            isCategoriesLoading: false,
            categoriesResponse: result.data,
          ),
        );
        break;

      case ApiErrorResult<MealsCategoriesResponseEntity>():
        emit(
          state.copyWith(
            isCategoriesLoading: false,
            categoriesFailure: result.failure,
          ),
        );
        break;
    }
  }
}

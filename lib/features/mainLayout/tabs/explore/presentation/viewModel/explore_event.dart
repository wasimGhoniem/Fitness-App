sealed class ExploreEvents {}

class GetAllExploreEvent extends ExploreEvents {
  GetAllExploreEvent({required this.id});
  final String id;
}

class GetMusclesByGroupIdEvent extends ExploreEvents {
  GetMusclesByGroupIdEvent({required this.id});
  final String id;
}

sealed class WorkOutEvents {}

class GetAllWorkOuts extends WorkOutEvents {
  GetAllWorkOuts({required this.id});
  final String id;
}

class GetWorkOutByeId extends WorkOutEvents {
  GetWorkOutByeId({required this.id});
  final String id;
}

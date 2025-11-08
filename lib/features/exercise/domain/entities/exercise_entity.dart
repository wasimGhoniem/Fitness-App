class ExerciseEntity {
  const ExerciseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    this.sets,
    this.reps,
    this.duration,
  });

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final int? sets;
  final int? reps;
  final int? duration;
}

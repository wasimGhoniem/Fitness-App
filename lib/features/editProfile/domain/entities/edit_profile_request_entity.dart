class EditProfileRequestEntity {
  const EditProfileRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.weight,
    required this.goal,
    required this.activityLevel,
  });

  final String firstName;
  final String lastName;
  final String email;
  final int weight;
  final String goal;
  final String activityLevel;
}

import 'package:fitness_app/core/models/exercise_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_screen_body.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ExerciseScreenBody(exerciseModel: exerciseModel));
  }
}

import 'package:fitness_app/features/exercise/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/food/domain/entity/meal_category_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/domain/entities/profile_entity.dart';

final List<MuscleEntity> musclesDummyList = const [
  MuscleEntity(id: '', image: '', name: 'dasdasd'),
  MuscleEntity(id: '', image: '', name: 'dasdasd'),
  MuscleEntity(id: '', image: '', name: 'dasdasd'),
  MuscleEntity(id: '', image: '', name: 'dasdasd'),
  MuscleEntity(id: '', image: '', name: 'dasdasd'),
];

final ProfileEntity profileDummy = const ProfileEntity(
  id: '',
  name: 'John Doe',
  avatar: '',
  email: 'john.doe@example.com',
);
final List<MuscleGroupEntity> musclesGroupDummyList = const [
  MuscleGroupEntity(id: '', name: 'dasdasd'),
  MuscleGroupEntity(id: '', name: 'dasdasd'),
  MuscleGroupEntity(id: '', name: 'dasdasd'),
  MuscleGroupEntity(id: '', name: 'dasdasd'),
  MuscleGroupEntity(id: '', name: 'dasdasd'),
];

final List<MealCategoryEntity> mealCategoryDummyList = const [
  MealCategoryEntity(
    categoryId: '',
    categoryName: 'dasdasd',
    categoryPhoto: '',
    categoryDescription: '',
  ),
  MealCategoryEntity(
    categoryId: '',
    categoryName: 'dasdasd',
    categoryPhoto: '',
    categoryDescription: '',
  ),
  MealCategoryEntity(
    categoryId: '',
    categoryName: 'dasdasd',
    categoryPhoto: '',
    categoryDescription: '',
  ),
];

final List<ExerciseEntity> exerciseDummyList = const [
  ExerciseEntity(
    imageUrl: '',
    id: '',
    name: 'asdads',
    description: 'asdadasdadasdasdaasdasd',
    videoUrl: '',
  ),
  ExerciseEntity(
    imageUrl: '',
    id: '',
    name: 'asdads',
    description: 'asdadasdadasdasdaasdasd',
    videoUrl: '',
  ),
  ExerciseEntity(
    imageUrl: '',
    id: '',
    name: 'asdads',
    description: 'asdadasdadasdasdaasdasd',
    videoUrl: '',
  ),
  ExerciseEntity(
    imageUrl: '',
    id: '',
    name: 'asdads',
    description: 'asdadasdadasdasdaasdasd',
    videoUrl: '',
  ),
  ExerciseEntity(
    imageUrl: '',
    id: '',
    name: 'asdads',
    description: 'asdadasdadasdasdaasdasd',
    videoUrl: '',
  ),
];

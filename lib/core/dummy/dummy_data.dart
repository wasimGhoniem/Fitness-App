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

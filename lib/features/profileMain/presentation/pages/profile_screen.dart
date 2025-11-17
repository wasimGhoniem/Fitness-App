import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_event.dart';
import 'package:fitness_app/features/profileMain/presentation/viewModels/profileViewModel/profile_main_view_model.dart';
import 'package:fitness_app/features/profileMain/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileMainViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<ProfileMainViewModel>();
    _viewModel.doIntend(GetLoggedUserDataEvent());
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: _viewModel, child: const ProfileViewBody());
  }
}

import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_bloc.dart';
import 'package:fitness_app/features/editProfile/presentation/viewModel/edit_profile_event.dart';
import 'package:fitness_app/features/editProfile/presentation/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final EditProfileViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<EditProfileViewModel>();
    _viewModel.doIntend(GetLoggedUserDataEvent());
  }

  @override
  void dispose() {
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: const Scaffold(body: EditProfileViewBody()),
    );
  }
}

import 'package:fitness_app/core/dummy/dummy_data.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_state.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/viewModel/explore_view_model.dart';
import 'package:fitness_app/features/mainLayout/tabs/explore/presentation/widgets/user_info.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreViewModel, ExploreState>(
      buildWhen: (p, c) =>
          p.isProfileLoading != c.isProfileLoading ||
          p.profileDataResponseEntity != c.profileDataResponseEntity ||
          p.profileFailure != c.profileFailure,
      builder: (context, state) {
        if (state.isProfileLoading) {
          return UserInfoWidget(isLoading: true, profileEntity: profileDummy);
        }

        if (state.profileFailure != null) {
          return Text(state.profileFailure!.errorMessage);
        }
        return UserInfoWidget(
          isLoading: false,
          profileEntity: state.profileDataResponseEntity!.profile,
        );
      },
    );
  }
}

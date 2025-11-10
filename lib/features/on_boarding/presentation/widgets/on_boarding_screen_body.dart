import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/on_boarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:fitness_app/features/on_boarding/presentation/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  late final OnBoardingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<OnBoardingViewModel>();
  }

  @override
  void dispose() {
    _viewModel.pageController.dispose();
    _viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _viewModel.pageController,
        itemCount: _viewModel.onBoardingList.length,
        itemBuilder: (context, index) => OnboardingWidget(
          currentIndex: index,
          totalPages: _viewModel.onBoardingList.length,
          pageController: _viewModel.pageController,
          onBoardingModel: _viewModel.onBoardingList[index],
        ),
      ),
    );
  }
}

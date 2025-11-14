import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/features/exercise/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_event.dart';
import 'package:fitness_app/features/exercise/presentation/viewModel/exercise_view_model.dart';
import 'package:fitness_app/features/exercise/presentation/widgets/exercise_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseListView extends StatefulWidget {
  const ExerciseListView({
    super.key,
    required this.exercises,
    required this.isLoading,
    required this.isPaginationLoading,
  });
  final List<ExerciseEntity> exercises;
  final bool isLoading;
  final bool isPaginationLoading;

  @override
  State<ExerciseListView> createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  late final ScrollController _scrollController;
  bool condition = true;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_addListener);
    super.initState();
  }

  void _addListener() async {
    final int maxScroll = _scrollController.position.maxScrollExtent.round();
    final int currentScroll = _scrollController.position.pixels.round();
    final bool isUserAtBottom = currentScroll >= maxScroll;

    if (isUserAtBottom && condition) {
      context.read<ExerciseViewModel>().doIntent(LoadMoreExercisesEvent());
      condition = false;
      await Future.delayed(const Duration(seconds: 2));
      condition = true;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppSizes.padding_16),
      itemCount: widget.exercises.length + (widget.isPaginationLoading ? 1 : 0),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        if (index == widget.exercises.length && widget.isPaginationLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding_16),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        }
        final exercise = widget.exercises[index];
        final videoId = YoutubePlayer.convertUrlToId(exercise.videoUrl) ?? '';
        final thumbnail = YoutubePlayer.getThumbnail(videoId: videoId);

        return GestureDetector(
          child: ExerciseItem(
            isLoading: widget.isLoading,
            thumbnail: thumbnail,
            exercises: exercise,
            videoId: videoId,
          ),
        );
      },
    );
  }
}

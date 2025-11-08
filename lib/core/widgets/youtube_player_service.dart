import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerService {
  static void playVideo(BuildContext context, String videoUrl) {
    if (videoUrl.isEmpty) {
      _showError(context, 'No video link available');
      return;
    }

    final String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId != null) {
      showDialog(
        context: context,
        builder: (context) => _VideoPlayerDialog(videoId: videoId),
      );
    } else {
      _showError(context, 'Invalid video link');
    }
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class _VideoPlayerDialog extends StatefulWidget {
  const _VideoPlayerDialog({required this.videoId});

  final String videoId;

  @override
  State<_VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<_VideoPlayerDialog> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
      ),
    );
  }
}

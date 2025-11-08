import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void showYoutubeVideoDilaog(BuildContext context, String videoId) {
  final controller = YoutubePlayerController(
    initialVideoId: videoId,
    flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
  );
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
      ),
    ),
  );
}

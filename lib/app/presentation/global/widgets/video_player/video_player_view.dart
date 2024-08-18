import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../domain/models/video.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';
import 'widgets/controls/video_player_controls.dart';
import 'widgets/video_player_error.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ChangeNotifierProvider<VideoPlayerBloc>(
        create: (_) => VideoPlayerBloc(VideoPlayerState.loading(),
            controller: VideoPlayerController.network(video.src))
          ..init(),
        builder: (context, _) {
          final VideoPlayerBloc bloc = context.watch();
          return bloc.value.map(
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            failed: (_) => const VideoPlayerError(),
            loaded: (_) => Stack(
              children: [
                VideoPlayer(bloc.controller),
                const VideoPlayerControls(),
              ],
            )
          );
        },
      ),
    );
  }
}

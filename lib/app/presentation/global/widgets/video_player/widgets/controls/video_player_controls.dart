import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/video_player/video_player_bloc.dart';

class VideoPlayerControls extends StatelessWidget {
  const VideoPlayerControls({super.key});


  @override
  Widget build(BuildContext context) {
    final VideoPlayerBloc bloc = context.watch();
    final state = bloc.state;

    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
              color: Colors.black26,
              child: IconButton(
                onPressed: () {
                  state.playerStatus.maybeWhen(
                    playing: () => bloc.pause(),
                    orElse: () => bloc.play(),
                  );
                },
                icon: Icon(
                  state.playerStatus.when(
                    playing: () => Icons.pause,
                    pause: () => Icons.play_arrow,
                    finish: () => Icons.replay,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_player_state.dart';

class VideoPlayerBloc extends ValueNotifier<VideoPlayerState> {
  VideoPlayerBloc(super.value, {required this.controller});

  final VideoPlayerController controller;
  VideoPlayerLoadedState get state => value.maybeMap(
        loaded: (state) => state,
        orElse: () => throw AssertionError(
            'Value is not an instance of videoPlayerLoadedState'),
      );

  Future<void> init() async {
    try {
      value.whenOrNull(
        failed: () {
          value = VideoPlayerState.loading();
        },
      );
      await controller.initialize();
      value = VideoPlayerState.loaded(duration: controller.value.duration);
      controller.addListener(_listener);
    } catch (_) {
      value = VideoPlayerState.failed();
    }
  }

  void _listener() {
    final controllerValue = controller.value;
    final position = controllerValue.position;
    final finished = position == state.duration;

    value = state.copyWith(
      position: position,
      playerStatus: finished ? const PlayerStatus.finish() : state.playerStatus,
    );
  }

  Future<void> play() async {
    await controller.play();
    value = state.copyWith(playerStatus: const PlayerStatus.playing());
  }

  Future<void> pause() async {
    await controller.pause();
    value = state.copyWith(playerStatus: const PlayerStatus.pause());
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }
}

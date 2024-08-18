import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {

  factory VideoPlayerState.loading() = _Loading;
  factory VideoPlayerState.failed() = _Failed;
  factory VideoPlayerState.loaded({
    required Duration duration,
    @Default(Duration.zero) Duration position,
    @Default(false) bool fullScreen,
    @Default(PlayerStatus.pause()) PlayerStatus playerStatus,
  }) = VideoPlayerLoadedState;
}

@freezed
class PlayerStatus with _$PlayerStatus {
  const factory PlayerStatus.playing() = _PlayIng;
  const factory PlayerStatus.pause() = _Pause;
  const factory PlayerStatus.finish() = _Finish;
}



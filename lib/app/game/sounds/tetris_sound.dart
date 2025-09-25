import 'package:audioplayers/audioplayers.dart';
import 'package:tetris/app/game/can_be_muted.dart';

class TetrisSound implements CanBeMuted {
  final String sourcePath;
  final _player = AudioPlayer();

  TetrisSound({required this.sourcePath});

  Future<void> initialize() async {
    try {
      var audioSource = AssetSource(sourcePath);
      await _player.setSource(audioSource);
      await _player.setVolume(1.0);
    } catch (e) {
      // ignore: avoid_print
      print("AUDIO: $sourcePath is not initialized");
    }
  }

  Future<void> play() async {
    return _player.resume();
  }

  Future<void> pause() async {
    return _player.pause();
  }

  Future<void> stop() async {
    return _player.stop();
  }

  @override
  Future<void> mute() async {
    return _player.setVolume(0.0);
  }

  @override
  Future<void> unMute() async {
    return _player.setVolume(1.0);
  }

  Future<void> dispose() async {
    return _player.dispose();
  }
}

class MusicTetrisSound extends TetrisSound {
  MusicTetrisSound({required super.sourcePath});

  @override
  Future<void> initialize() async {
    await super.initialize();
    _player.setReleaseMode(ReleaseMode.loop);
  }
}

class EffectTetrisSound extends TetrisSound {
  EffectTetrisSound({required super.sourcePath});

  @override
  Future<void> initialize() async {
    await super.initialize();
    _player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  Future<void> play() async {
    await super.stop();
    return super.play();
  }
}

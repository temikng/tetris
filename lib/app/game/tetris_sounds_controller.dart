import 'package:audioplayers/audioplayers.dart';
import 'package:tetris/app/game/can_be_muted.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/sounds/tetris_sound.dart';

class TetrisSoundsController implements CanBeMuted {
  final bgMusic = MusicTetrisSound(sourcePath: 'sounds/bg_music.mp3');
  final effectsController = TetrisSoundEffectsController();

  Future<void> _initGlobalAudioContext() async {
    await AudioPlayer.global.setAudioContext(
      AudioContext(
        android: const AudioContextAndroid(
          stayAwake: false,
          contentType: AndroidContentType.speech,
          audioFocus: AndroidAudioFocus.none,
          usageType: AndroidUsageType.game,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playAndRecord,
          options: const {
            AVAudioSessionOptions.allowAirPlay,
            AVAudioSessionOptions.allowBluetooth,
            AVAudioSessionOptions.allowBluetoothA2DP,
            AVAudioSessionOptions.defaultToSpeaker,
            AVAudioSessionOptions.duckOthers,
          },
        ),
      ),
    );
  }

  Future<void> initialize() async {
    await _initGlobalAudioContext();
    await bgMusic.initialize();
    await effectsController.initialize();
  }

  @override
  Future<void> mute() async {
    await bgMusic.mute();
    await effectsController.mute();
  }

  @override
  Future<void> unMute() async {
    await bgMusic.unMute();
    await effectsController.unMute();
  }

  Future<void> dispose() async {
    await bgMusic.dispose();
    await effectsController.dispose();
  }
}

import 'package:tetris/app/game/can_be_muted.dart';
import 'package:tetris/app/game/sounds/tetris_sound.dart';

enum EffectSounds {
  menuPress,
  movePiece,
  rotatePiece,
  pieceLanded,
  lineClear,
  levelUp,
  gameOver,
}

class TetrisSoundEffectsController implements CanBeMuted {
  final _effectSoundControllers = {
    EffectSounds.menuPress: EffectTetrisSound(
      sourcePath: 'sounds/menu_press.mp3',
    ),
    EffectSounds.movePiece: EffectTetrisSound(
      sourcePath: 'sounds/move_piece.wav',
    ),
    EffectSounds.rotatePiece: EffectTetrisSound(
      sourcePath: 'sounds/rotate_piece.mp3',
    ),
    EffectSounds.pieceLanded: EffectTetrisSound(
      sourcePath: 'sounds/piece_landed.mp3',
    ),
    EffectSounds.lineClear: EffectTetrisSound(
      sourcePath: 'sounds/line_clear.mp3',
    ),
    EffectSounds.levelUp: EffectTetrisSound(sourcePath: 'sounds/level_up.mp3'),
    EffectSounds.gameOver: EffectTetrisSound(
      sourcePath: 'sounds/game_over.mp3',
    ),
  };

  Future<void> initialize() async {
    await Future.wait(
      _effectSoundControllers.values.map((sc) => sc.initialize()),
    );
  }

  Future<void> play(EffectSounds type) async {
    await _effectSoundControllers[type]?.play();
  }

  @override
  Future<void> mute() async {
    await Future.wait(_effectSoundControllers.values.map((sc) => sc.mute()));
  }

  @override
  Future<void> unMute() async {
    await Future.wait(_effectSoundControllers.values.map((sc) => sc.unMute()));
  }

  Future<void> dispose() async {
    await Future.wait(_effectSoundControllers.values.map((sc) => sc.dispose()));
  }
}

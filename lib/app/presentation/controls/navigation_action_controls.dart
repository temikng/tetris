import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/presentation/const/tetris_sizes.dart';
import 'package:tetris/app/presentation/controls/ui_button.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';

class NavigationActionControls extends ConsumerWidget {
  const NavigationActionControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: navigationActionButtonSize,
      height: navigationActionButtonSize,
      child: UiButton(onPressed: () => rotate(ref)),
    );
  }

  bool _hasGameNotStared(WidgetRef ref) {
    return ref.read(gameStateProvider).value != TetrisGameState.started;
  }

  void rotate(WidgetRef ref) {
    if (_hasGameNotStared(ref)) return;
    if (ref.read(gameControllerProvider).rotate()) {
      ref
          .read(soundsControllerProvider)
          .effectsController
          .play(EffectSounds.rotatePiece);
    }
  }
}

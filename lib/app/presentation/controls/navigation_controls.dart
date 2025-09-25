import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/app/presentation/controls/ui_button.dart';

class NavigationControls extends ConsumerWidget {
  static const double navigationButtonSize = 60;
  static const double actionButtonSize = 120;

  const NavigationControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: navigationButtonSize,
                  height: navigationButtonSize,
                  child: UiButton(onPressed: () => moveLeft(ref)),
                ),
                SizedBox(
                  width: navigationButtonSize,
                  height: navigationButtonSize,
                ),
                SizedBox(
                  width: navigationButtonSize,
                  height: navigationButtonSize,
                  child: UiButton(onPressed: () => moveRight(ref)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: navigationButtonSize,
                  height: navigationButtonSize,
                ),
                SizedBox(
                  width: navigationButtonSize,
                  height: navigationButtonSize,
                  child: UiButton(onPressed: () => dropFast(ref)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: actionButtonSize,
          height: actionButtonSize,
          child: UiButton(onPressed: () => rotate(ref)),
        ),
      ],
    );
  }

  bool _hasGameNotStared(WidgetRef ref) {
    return ref.read(gameStateProvider).value != TetrisGameState.started;
  }

  void _playMovePieceSound(WidgetRef ref) {
    ref
        .read(soundsControllerProvider)
        .effectsController
        .play(EffectSounds.movePiece);
  }

  void moveLeft(WidgetRef ref) {
    if (_hasGameNotStared(ref)) return;
    if (ref.read(gameControllerProvider).moveLeft()) {
      _playMovePieceSound(ref);
    }
  }

  void moveRight(WidgetRef ref) {
    if (_hasGameNotStared(ref)) return;
    if (ref.read(gameControllerProvider).moveRight()) {
      _playMovePieceSound(ref);
    }
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

  void dropFast(WidgetRef ref) {
    if (_hasGameNotStared(ref)) return;
    if (ref.read(gameControllerProvider).dropFast()) {
      _playMovePieceSound(ref);
    }
  }
}

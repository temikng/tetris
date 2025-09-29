import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/presentation/const/tetris_sizes.dart';
import 'package:tetris/app/presentation/controls/ui_button.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/const/fonts.dart';

class MenuGameControls extends ConsumerWidget {
  const MenuGameControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Column(
          spacing: 4,
          children: [
            Text(
              "START/PAUSE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: mainFontFamily,
                fontSize: 8.0,
              ),
            ),
            SizedBox(
              width: menuControlButtonSize,
              height: menuControlButtonSize,
              child: UiButton(
                onPressed: () => startPause(ref),
                color: Color(0xff69c635),
              ),
            ),
          ],
        ),
        Column(
          spacing: 4,
          children: [
            Text(
              "RESTART",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: mainFontFamily,
                fontSize: 8.0,
              ),
            ),
            SizedBox(
              width: menuControlButtonSize,
              height: menuControlButtonSize,
              child: UiButton(
                onPressed: () => restart(ref),
                color: Color(0xffbf3126),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _playMenuPressSound(WidgetRef ref) {
    ref
        .read(soundsControllerProvider)
        .effectsController
        .play(EffectSounds.menuPress);
  }

  void restart(WidgetRef ref) {
    _playMenuPressSound(ref);
    ref.read(gameControllerProvider).restart();
  }

  void startPause(WidgetRef ref) {
    final gameState = ref.read(gameStateProvider).value;
    if (gameState == TetrisGameState.gameOver) return;

    _playMenuPressSound(ref);
    if (gameState == TetrisGameState.started) {
      ref.read(gameControllerProvider).pause();
    } else {
      ref.read(gameControllerProvider).start();
    }
  }
}

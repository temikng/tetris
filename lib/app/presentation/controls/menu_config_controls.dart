import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/presentation/const/tetris_sizes.dart';
import 'package:tetris/app/presentation/controls/ui_button.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/game_settings_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/const/fonts.dart';

class MenuConfigControls extends ConsumerWidget {
  const MenuConfigControls({super.key});

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
              "SOUND",
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
                onPressed: () => toggleSound(ref),
                color: Color(0xff69c635),
              ),
            ),
          ],
        ),
        Column(
          spacing: 4,
          children: [
            Text(
              "COLOR MODE",
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
                onPressed: () => toggleColoredMode(ref),
                color: Color(0xff69c635),
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

  void toggleSound(WidgetRef ref) {
    _playMenuPressSound(ref);
    ref.read(mutedStateProvider.notifier).toggle();
  }

  void toggleColoredMode(WidgetRef ref) {
    _playMenuPressSound(ref);
    ref.read(coloredStateProvider.notifier).toggle();
  }
}

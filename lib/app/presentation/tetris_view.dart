import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/controls/tetris_controls.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/game_settings_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/app/providers/vibration_controller_provider.dart';
import 'package:tetris/const/fonts.dart';
import 'package:tetris/app/presentation/display/tetris_display.dart';

class TetrisView extends ConsumerStatefulWidget {
  const TetrisView({super.key});

  @override
  ConsumerState<TetrisView> createState() => _TetrisViewState();
}

class _TetrisViewState extends ConsumerState<TetrisView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ref.read(gameControllerProvider).restart();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      ref.read(gameControllerProvider).pause();
    }
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await ref.read(soundsControllerProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(mutedStateProvider, (_, muted) {
      if (muted) {
        ref.read(vibrationControllerProvider).mute();
        ref.read(soundsControllerProvider).mute();
      } else {
        ref.read(vibrationControllerProvider).unMute();
        ref.read(soundsControllerProvider).unMute();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "TETRIS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: mainFontFamily,
                  fontSize: 18.0,
                ),
              ),
              Expanded(child: TetrisDisplay()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TetrisControls(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

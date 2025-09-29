import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/tetris_portrait_view.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/game_settings_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/app/providers/vibration_controller_provider.dart';
import 'package:tetris/app/tetris_landscape_view.dart';

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
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              switch (orientation) {
                case Orientation.portrait:
                  return TetrisPortraitView();
                case Orientation.landscape:
                  return TetrisLandscapeView();
              }
            },
          ),
        ),
      ),
    );
  }
}

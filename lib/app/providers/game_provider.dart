import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/blocs/high_score_bloc.dart';
import 'package:tetris/app/game/blocs/level_bloc.dart';
import 'package:tetris/app/game/blocs/score_bloc.dart';
import 'package:tetris/app/game/tetris_figures_provider.dart';
import 'package:tetris/app/game/tetris_game_params.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/game/tetris_game_state_data.dart';
import 'package:tetris/app/providers/high_score_repository_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';
import 'package:tetris/app/providers/vibration_controller_provider.dart';
import 'package:tetris/const/game.dart';
import 'package:tetris/app/game/tetris_figure.dart';
import 'package:tetris/app/game/tetris_game_controller.dart';

final gameControllerProvider = Provider<TetrisGameController>((ref) {
  return TetrisGameController(
    gameParams: TetrisGameParams(
      cols: numberOfFieldColumns,
      rows: numberOfFieldRows,
    ),
    figuresProvider: TetrisFiguresProvider(),
    soundsController: ref.watch(soundsControllerProvider),
    vibrationController: ref.watch(vibrationControllerProvider),
    levelBloc: LevelBloc(),
    scoreBloc: ScoreBloc(),
    highScoreBloc: HighScoreBloc(ref.watch(highScoreRepositoryProvider)),
  );
});

final scoreProvider = StreamProvider.autoDispose<int>(
  (ref) => ref.watch(gameControllerProvider).score$,
);

final highScoreProvider = StreamProvider.autoDispose<int>(
  (ref) => ref.watch(gameControllerProvider).highScore$,
);

final levelProvider = StreamProvider.autoDispose<int>(
  (ref) => ref.watch(gameControllerProvider).level$,
);

final nextFigureProvider = StreamProvider.autoDispose<TetrisFigure>(
  (ref) => ref.watch(gameControllerProvider).nextFigure$,
);

final gameStateProvider = StreamProvider.autoDispose<TetrisGameState>(
  (ref) => ref.watch(gameControllerProvider).gameState$,
);

final gameStateDataProvider = StreamProvider.autoDispose<TetrisGameStateData>(
  (ref) => ref.watch(gameControllerProvider).stateData$,
);

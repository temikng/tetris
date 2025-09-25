import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:tetris/app/game/blocs/high_score_bloc.dart';
import 'package:tetris/app/game/blocs/level_bloc.dart';
import 'package:tetris/app/game/blocs/score_bloc.dart';
import 'package:tetris/app/game/sounds/effect_sounds.dart';
import 'package:tetris/app/game/tetris_game_params.dart';
import 'package:tetris/app/game/tetris_figure.dart';
import 'package:tetris/app/game/tetris_figures_provider.dart';
import 'package:tetris/app/game/tetris_game_logic.dart';
import 'package:tetris/app/game/tetris_game_looper.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/game/tetris_game_state_data.dart';
import 'package:tetris/app/game/tetris_sounds_controller.dart';
import 'package:tetris/app/game/vibration_controller.dart';

class TetrisGameController {
  final TetrisSoundsController soundsController;
  final VibrationController vibrationController;
  final TetrisFiguresProvider figuresProvider;
  final TetrisGameParams gameParams;

  late TetrisGameLooper _gameLooper;
  late TetrisGameLogic _gameLogic;

  final _gameState$Ctrl = BehaviorSubject.seeded(TetrisGameState.restarted);
  final _nextFigure$Ctrl = BehaviorSubject<TetrisFigure>();

  late ScoreBloc scoreBloc;
  late LevelBloc levelBloc;
  late HighScoreBloc highScoreBloc;

  Stream<TetrisGameStateData> get stateData$ => _gameLogic.stateData$;

  Stream<TetrisGameState> get gameState$ => _gameState$Ctrl.stream;

  Stream<TetrisFigure> get nextFigure$ => _nextFigure$Ctrl.stream;

  Stream<int> get score$ => scoreBloc.value$;

  Stream<int> get level$ => levelBloc.level$;

  Stream<int> get highScore$ => highScoreBloc.value$;

  TetrisGameController({
    required this.gameParams,
    required this.figuresProvider,
    required this.soundsController,
    required this.vibrationController,
    required this.scoreBloc,
    required this.levelBloc,
    required this.highScoreBloc,
  }) {
    _gameLogic = TetrisGameLogic(gameParams);
    _gameLooper = TetrisGameLooper();
    _gameLooper.addTickListener(tick);
  }

  void restart() {
    soundsController.bgMusic.stop();
    _gameLogic.initialize(emptyTetrisFigure: figuresProvider.emptyTetrisFigure);
    _nextFigure$Ctrl.add(figuresProvider.getRandomFigure());
    scoreBloc.reset();
    levelBloc.reset();
    _gameState$Ctrl.add(TetrisGameState.restarted);
  }

  void start() {
    if (_gameState$Ctrl.value == TetrisGameState.restarted) {
      spawnFigure();
    }
    soundsController.bgMusic.play();
    _gameLooper.start();
    _gameState$Ctrl.add(TetrisGameState.started);
  }

  void pause() {
    soundsController.bgMusic.pause();
    _gameLooper.stop();
    _gameState$Ctrl.add(TetrisGameState.paused);
  }

  void spawnFigure() async {
    _gameLogic.spawnFigure(figure: _nextFigure$Ctrl.value);
    _nextFigure$Ctrl.add(figuresProvider.getRandomFigure());
  }

  void tick() {
    if (_gameLogic.doMoveAndCheckCollision()) {
      _gameLogic.mergeFigure();
      int newClearedLines = _gameLogic.clearLines();
      spawnFigure();

      if (newClearedLines > 0) {
        final oldLevel = levelBloc.level;

        scoreBloc.addClearedLines(newClearedLines);
        levelBloc.addClearedLines(newClearedLines);
        if (oldLevel < levelBloc.level) {
          _gameLooper.increaseSpeedTimes(levelBloc.level);

          soundsController.effectsController.play(EffectSounds.levelUp);
        } else {
          soundsController.effectsController.play(EffectSounds.lineClear);
        }

        vibrationController.vibrate();
      } else {
        soundsController.effectsController.play(EffectSounds.pieceLanded);
        vibrationController.vibrateWeakly();
      }

      if (_gameLogic.checkCurrentCollision()) {
        gameOver();
      }
    }
  }

  void gameOver() {
    soundsController.bgMusic.stop();
    _gameLooper.stop();
    _gameState$Ctrl.add(TetrisGameState.gameOver);
    soundsController.effectsController.play(EffectSounds.gameOver);
    vibrationController.vibrateLong();
    _updateHighScore();
  }

  void _updateHighScore() {
    if (scoreBloc.value > highScoreBloc.value) {
      highScoreBloc.set(scoreBloc.value);
    }
  }

  bool moveLeft() => _gameLogic.moveLeft();

  bool moveRight() => _gameLogic.moveRight();

  bool dropFast() {
    bool dropped = _gameLogic.dropFast();
    if (dropped) tick();
    return dropped;
  }

  bool rotate() => _gameLogic.rotate();
}

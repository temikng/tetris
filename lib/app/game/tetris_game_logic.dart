import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:tetris/app/game/tetris_field.dart';
import 'package:tetris/app/game/tetris_figure.dart';
import 'package:tetris/app/game/tetris_game_params.dart';
import 'package:tetris/app/game/tetris_game_state_data.dart';

class TetrisGameLogic {
  final TetrisGameParams _params;
  late TetrisField field;
  late TetrisFigure currentFigure;
  int curX = 0;
  int curY = 0;

  final _stateData$Ctrl = BehaviorSubject<TetrisGameStateData>();

  Stream<TetrisGameStateData> get stateData$ => _stateData$Ctrl.stream;

  TetrisGameLogic(this._params);

  TetrisGameStateData get _state => TetrisGameStateData(
    field: field,
    currentFigure: currentFigure,
    curX: curX,
    curY: curY,
  );

  void _updateStateData() {
    _stateData$Ctrl.add(_state);
  }

  void initialize({required TetrisFigure emptyTetrisFigure}) {
    field = List.generate(_params.rows, (_) => List.filled(_params.cols, 0));
    currentFigure = emptyTetrisFigure;
    _updateStateData();
  }

  void spawnFigure({required TetrisFigure figure}) {
    currentFigure = figure;
    if (currentFigure.isNotEmpty) {
      curX = _params.cols ~/ 2 - currentFigure[0].length ~/ 2;
    } else {
      curX = 0;
    }
    curY = -(currentFigure.length) + 1;
    _updateStateData();
  }

  bool collision(int x, int y, List<List<int>> fig) {
    for (int i = 0; i < fig.length; i++) {
      for (int j = 0; j < fig[i].length; j++) {
        if (fig[i][j] != 0) {
          int nx = x + j;
          int ny = y + i;
          if (nx < 0 || nx >= _params.cols || ny >= _params.rows) return true;
          if (ny >= 0 && field[ny][nx] != 0) return true;
        }
      }
    }
    return false;
  }

  void mergeFigure() {
    bool merged = false;
    for (int i = 0; i < currentFigure.length; i++) {
      for (int j = 0; j < currentFigure[i].length; j++) {
        if (currentFigure[i][j] != 0 && curY + i >= 0) {
          field[curY + i][curX + j] = currentFigure[i][j];
          merged = true;
        }
      }
    }
    if (merged) {
      _updateStateData();
    }
  }

  int clearLines() {
    int cleared = 0;
    field.removeWhere((row) {
      if (row.every((cell) => cell != 0)) {
        cleared++;
        return true;
      }
      return false;
    });
    while (field.length < _params.rows) {
      field.insert(0, List.filled(_params.cols, 0));
    }

    if (cleared > 0) {
      _updateStateData();
    }

    return cleared;
  }

  bool checkCurrentCollision() {
    return collision(curX, curY, currentFigure);
  }

  bool checkNextMoveCollision() {
    return collision(curX, curY + 1, currentFigure);
  }

  bool doMoveAndCheckCollision() {
    if (!checkNextMoveCollision()) {
      curY++;
      _updateStateData();
      return false;
    } else {
      return true;
    }
  }

  bool moveLeft() {
    if (!collision(curX - 1, curY, currentFigure)) {
      curX--;
      _updateStateData();
      return true;
    }
    return false;
  }

  bool moveRight() {
    if (!collision(curX + 1, curY, currentFigure)) {
      curX++;
      _updateStateData();
      return true;
    }
    return false;
  }

  bool rotate() {
    final rotated = List.generate(
      currentFigure[0].length,
      (j) => List.generate(
        currentFigure.length,
        (i) => currentFigure[currentFigure.length - i - 1][j],
      ),
    );
    if (!collision(curX, curY, rotated)) {
      currentFigure = rotated;
      _updateStateData();
      return true;
    }
    return false;
  }

  bool dropFast() {
    bool dropped = false;
    while (!checkNextMoveCollision()) {
      dropped = true;
      curY++;
    }
    if (dropped) {
      _updateStateData();
    }
    return dropped;
  }
}

import 'dart:math';

import 'package:tetris/app/game/tetris_figure.dart';

class TetrisFiguresProvider {
  final TetrisFigure emptyTetrisFigure = [];

  final List<TetrisFigure> _figures = [
    // I
    [
      [1, 1, 1, 1],
    ],
    // O
    [
      [2, 2],
      [2, 2],
    ],
    // T
    [
      [0, 3, 0],
      [3, 3, 3],
    ],
    // L
    [
      [4, 0],
      [4, 0],
      [4, 4],
    ],
    // J
    [
      [0, 5],
      [0, 5],
      [5, 5],
    ],
    // S
    [
      [0, 6, 6],
      [6, 6, 0],
    ],
    // Z
    [
      [7, 7, 0],
      [0, 7, 7],
    ],
  ];

  TetrisFigure getRandomFigure() {
    final rnd = Random();
    return _figures[rnd.nextInt(_figures.length)].map((r) => [...r]).toList();
  }
}

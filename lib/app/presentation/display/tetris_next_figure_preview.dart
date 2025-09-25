import 'package:flutter/material.dart';
import 'package:tetris/app/game/tetris_field.dart';
import 'package:tetris/app/game/tetris_figure.dart';
import 'package:tetris/app/game/tetris_game_params.dart';
import 'package:tetris/app/game/tetris_game_state_data.dart';
import 'package:tetris/app/presentation/display/tetris_game_canvas.dart';

class TetrisNextFigurePreview extends StatelessWidget {
  final int size = 4;
  final TetrisFigure figure;
  final bool isColoredMode;
  late final TetrisField field;
  late final int curX;
  late final int curY;

  TetrisNextFigurePreview({
    super.key,
    required this.figure,
    required this.isColoredMode,
  }) {
    field = List.generate(size, (_) => List.filled(size, 0));
    curX = size ~/ 2 - figure[0].length ~/ 2;
    curY = size ~/ 2 - figure.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TetrisGameCanvas(
        gameParams: TetrisGameParams(cols: size, rows: size),
        gameStateData: TetrisGameStateData(
          field: field,
          currentFigure: figure,
          curX: curX,
          curY: curY,
        ),
        isColoredMode: isColoredMode,
        hasBorder: false,
      ),
    );
  }
}

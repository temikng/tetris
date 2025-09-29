import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/app/game/tetris_game_params.dart';
import 'package:tetris/app/game/tetris_game_state_data.dart';
import 'package:tetris/app/presentation/utils/measure_size.dart';
import 'package:tetris/app/presentation/const/tetris_colors.dart';

class TetrisGameCanvas extends StatefulWidget {
  static const defaultColor = filledBrickColor;

  final Function(Size)? onCanvasSizeChanged;
  final TetrisGameParams gameParams;
  final TetrisGameStateData gameStateData;
  final bool isColoredMode;
  final bool hasBorder;

  const TetrisGameCanvas({
    super.key,
    required this.gameParams,
    required this.gameStateData,
    required this.isColoredMode,
    required this.hasBorder,
    this.onCanvasSizeChanged,
  });

  @override
  State<TetrisGameCanvas> createState() => _TetrisGameCanvasState();
}

class _TetrisGameCanvasState extends State<TetrisGameCanvas> {
  late Size _customPaintSize;
  double _widgetHeight = 0.0;
  double _blockSize = 20.0;

  @override
  void initState() {
    _calculatePaintSize();
    super.initState();
  }

  void _calculatePaintSize() {
    _customPaintSize = Size(
      widget.gameParams.cols * _blockSize,
      widget.gameParams.rows * _blockSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: _handleNewSize,
      child: Center(
        child: CustomPaint(
          size: _customPaintSize,
          painter: _TetrisPainter(
            widget.gameStateData,
            widget.gameParams,
            _blockSize,
            widget.isColoredMode,
            widget.hasBorder,
          ),
        ),
      ),
    );
  }

  void _handleNewSize(Size size) {
    if (_widgetHeight == size.height) return;

    double blockWidth = size.width / widget.gameParams.cols;
    double blockHeight = size.height / widget.gameParams.rows;
    _blockSize = min(blockWidth, blockHeight);
    _calculatePaintSize();
    _widgetHeight = size.height;
    setState(() {});
    widget.onCanvasSizeChanged?.call(_customPaintSize);
  }
}

class _TetrisPainter extends CustomPainter {
  final TetrisGameStateData _gameState;
  final TetrisGameParams _gameParams;
  final double blockSize;
  final bool isColoredMode;
  final bool hasBorder;

  _TetrisPainter(
    this._gameState,
    this._gameParams,
    this.blockSize,
    this.isColoredMode,
    this.hasBorder,
  );

  void _paintBrick(Canvas canvas, Paint paint, int i, int j, Color color) {
    var gap = 1;
    paint.color = color;
    canvas.drawRect(
      Rect.fromLTWH(
        j * blockSize + gap,
        i * blockSize + gap,
        blockSize - (gap * 2),
        blockSize - (gap * 2),
      ),
      paint,
    );
    gap = 3;
    paint.color = Color(0xffa0a989);
    canvas.drawRect(
      Rect.fromLTWH(
        j * blockSize + gap,
        i * blockSize + gap,
        blockSize - (gap * 2),
        blockSize - (gap * 2),
      ),
      paint,
    );
    gap = 5;
    paint.color = color;
    canvas.drawRect(
      Rect.fromLTWH(
        j * blockSize + gap,
        i * blockSize + gap,
        blockSize - (gap * 2),
        blockSize - (gap * 2),
      ),
      paint,
    );
  }

  Color _getBrickColor(int type) {
    return isColoredMode == true
        ? colorsOfFigures[type] ?? TetrisGameCanvas.defaultColor
        : TetrisGameCanvas.defaultColor;
  }

  void _paintField(Canvas canvas, Paint paint) {
    for (int i = 0; i < _gameParams.rows; i++) {
      for (int j = 0; j < _gameParams.cols; j++) {
        if (_gameState.field[i][j] == 0) {
          _paintBrick(canvas, paint, i, j, emptyBrickColor);
        } else {
          _paintBrick(
            canvas,
            paint,
            i,
            j,
            _getBrickColor(_gameState.field[i][j]),
          );
        }
      }
    }
  }

  void _paintCurrentFigure(Canvas canvas, Paint paint) {
    for (int i = 0; i < _gameState.currentFigure.length; i++) {
      for (int j = 0; j < _gameState.currentFigure[i].length; j++) {
        if (_gameState.currentFigure[i][j] != 0 && _gameState.curY + i >= 0) {
          _paintBrick(
            canvas,
            paint,
            (_gameState.curY + i),
            (_gameState.curX + j),
            _getBrickColor(_gameState.currentFigure[i][j]),
          );
        }
      }
    }
  }

  void _paintBorder(Canvas canvas, Paint paint, Size s) {
    paint.color = filledBrickColor;
    paint.strokeWidth = 3;
    canvas.drawRect(Rect.fromLTWH(-2, -2, s.width + 4, s.height + 4), paint);
  }

  @override
  void paint(Canvas canvas, Size s) {
    final paint = Paint()..style = PaintingStyle.stroke;

    if (hasBorder) {
      _paintBorder(canvas, paint, s);
    }

    paint.style = PaintingStyle.fill;

    _paintField(canvas, paint);
    _paintCurrentFigure(canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

import 'package:flutter/rendering.dart';
import 'package:tetris/app/game/tetris_game_state.dart';
import 'package:tetris/app/presentation/const/tetris_colors.dart';

class TetrisStatePainter extends CustomPainter {
  final TetrisGameState? gameState;

  TetrisStatePainter(this.gameState);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = filledBrickColor;

    switch (gameState) {
      case TetrisGameState.started:
        paintStarted(canvas, paint, size);
        break;
      case TetrisGameState.paused:
        paintPaused(canvas, paint, size);
        break;
      default:
        paintStopped(canvas, paint, size);
    }
  }

  void paintStarted(Canvas canvas, Paint paint, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  void paintPaused(Canvas canvas, Paint paint, Size size) {
    final gap = 2;
    final w = size.width / 2;
    canvas.drawRect(Rect.fromLTWH(0, 0, w - gap, size.height), paint);
    canvas.drawRect(Rect.fromLTWH(w + gap, 0, w - gap, size.height), paint);
  }

  void paintStopped(Canvas canvas, Paint paint, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

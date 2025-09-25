import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetris/app/game/tetris_field.dart';
import 'package:tetris/app/game/tetris_figure.dart';

part 'tetris_game_state_data.freezed.dart';

@freezed
abstract class TetrisGameStateData with _$TetrisGameStateData {
  const factory TetrisGameStateData({
    required TetrisField field,
    required TetrisFigure currentFigure,
    required int curX,
    required int curY,
  }) = _TetrisGameStateData;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tetris_game_params.freezed.dart';

@freezed
abstract class TetrisGameParams with _$TetrisGameParams {
  const factory TetrisGameParams({
    required int cols,
    required int rows,
  }) = _TetrisGameParams;
}

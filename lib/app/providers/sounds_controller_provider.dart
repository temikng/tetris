import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/tetris_sounds_controller.dart';

final soundsControllerProvider = Provider<TetrisSoundsController>(
  (_) => TetrisSoundsController(),
);

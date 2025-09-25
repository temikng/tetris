import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/game/vibration_controller.dart';

final vibrationControllerProvider = Provider<VibrationController>(
  (ref) => VibrationController(),
);

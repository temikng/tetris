import 'dart:async';
import 'dart:ui';

const defaultSpeedInMilliseconds = 1000;

class TetrisGameLooper {
  Timer? timer;
  VoidCallback? _tickCallback;
  Duration speed = const Duration(milliseconds: defaultSpeedInMilliseconds);

  TetrisGameLooper();

  bool get isStarted => timer != null;

  void start() {
    if (timer != null) return;
    _initializeTimer();
  }

  void stop() {
    timer?.cancel();
    timer = null;
  }

  void restart() {
    stop();
    start();
  }

  void addTickListener(VoidCallback callback) {
    _tickCallback = callback;
  }

  void increaseSpeedTimes(int times) {
    int newMs = (defaultSpeedInMilliseconds - (50 * times)).clamp(
      100,
      defaultSpeedInMilliseconds,
    );
    speed = Duration(milliseconds: newMs);
    restart();
  }

  void resetSpeed() {
    speed = Duration(milliseconds: defaultSpeedInMilliseconds);
  }

  void _initializeTimer() {
    timer = Timer.periodic(speed, (_) => _tick());
  }

  void _tick() {
    _tickCallback?.call();
  }
}

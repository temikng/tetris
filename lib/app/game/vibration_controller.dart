import 'package:tetris/app/game/can_be_muted.dart';
import 'package:vibration/vibration.dart';

class VibrationController implements CanBeMuted {
  bool _muted = false;

  @override
  Future<void> mute() async {
    _muted = true;
  }

  @override
  Future<void> unMute() async {
    _muted = false;
  }

  Future<void> vibrate() async {
    if (_muted) return;
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  Future<void> vibrateWeakly() async {
    if (_muted) return;
    if (await Vibration.hasAmplitudeControl()) {
      Vibration.vibrate(amplitude: 32);
    }
  }

  Future<void> vibrateLong() async {
    if (_muted) return;
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 1000);
    } else {
      Vibration.vibrate();
      await Future.delayed(Duration(milliseconds: 500));
      Vibration.vibrate();
    }
  }
}

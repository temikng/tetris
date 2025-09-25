import 'package:rxdart/subjects.dart';

class LevelBloc {
  final _level$Ctrl = BehaviorSubject<int>.seeded(1);
  int _clearedLines = 0;
  int _level = 1;

  int get level => _level;

  Stream<int> get level$ => _level$Ctrl.stream;

  void addClearedLines(int clearedLines) {
    _clearedLines += clearedLines;

    final newLevel = _clearedLines ~/ 5 + 1;

    if (newLevel > _level) {
      _level = newLevel;
      _level$Ctrl.add(newLevel);
    }
  }

  void reset() {
    _clearedLines = 0;
    _level = 1;
    _level$Ctrl.add(1);
  }
}

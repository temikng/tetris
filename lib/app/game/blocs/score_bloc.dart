import 'package:rxdart/subjects.dart';
import 'package:tetris/const/game.dart';

class ScoreBloc {
  final BehaviorSubject<int> _valueStream = BehaviorSubject<int>.seeded(0);
  int _value = 0;

  int get value => _value;

  Stream<int> get value$ => _valueStream.stream;

  void addClearedLines(int clearedLines) {
    final points = _getScorePointsByClearedLines(clearedLines);
    _value += points;
    _updateStream();
  }

  void reset() {
    _value = 0;
    _updateStream();
  }

  int _getScorePointsByClearedLines(int clearedLines) {
    return graduationOfPointsScored[clearedLines];
  }

  void _updateStream() {
    _valueStream.add(_value);
  }
}

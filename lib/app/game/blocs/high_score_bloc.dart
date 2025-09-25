import 'package:rxdart/subjects.dart';
import 'package:tetris/data/repository/high_score_repository.dart';

class HighScoreBloc {
  final HighScoreRepository _highScoreRepository;
  final _value$Ctrl = BehaviorSubject<int>.seeded(0);
  int _value = 0;

  Stream<int> get value$ => _value$Ctrl.stream;

  int get value => _value;

  HighScoreBloc(this._highScoreRepository) {
    init();
  }

  void init() async {
    final savedValue = await _highScoreRepository.highScore;
    if (savedValue > _value) {
      set(savedValue);
    }
  }

  void set(int value) {
    _value = value;
    _value$Ctrl.add(value);
    _highScoreRepository.highScore = value;
  }
}

import 'package:tetris/domain/repository/high_score_repository.dart';
import 'package:tetris/data/datasources/local_data_source.dart';

class HighScoreRepository implements IHighScoreRepository {
  static const _storageKey = 'high_score';

  final LocalDataSource _localDataSource;

  HighScoreRepository(this._localDataSource);

  @override
  Future<int> get highScore async =>
      _localDataSource.getValue(_storageKey, defaultValue: 0);

  @override
  set highScore(int value) => _localDataSource.setValue(_storageKey, value);
}

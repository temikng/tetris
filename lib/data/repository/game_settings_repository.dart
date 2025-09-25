import 'package:tetris/domain/repository/game_settings_repository.dart';
import 'package:tetris/data/datasources/local_data_source.dart';

class GameSettingsRepository implements IGameSettingsRepository {
  static const mutedStorageKey = 'muted';
  static const coloredStorageKey = 'colored';

  final LocalDataSource _localDataSource;

  GameSettingsRepository(this._localDataSource);

  @override
  Future<bool> get muted async =>
      _localDataSource.getValue(mutedStorageKey, defaultValue: false);

  @override
  set muted(bool value) => _localDataSource.setValue(mutedStorageKey, value);

  @override
  Future<bool> get colored async =>
      _localDataSource.getValue(coloredStorageKey, defaultValue: false);

  @override
  set colored(bool value) =>
      _localDataSource.setValue(coloredStorageKey, value);
}

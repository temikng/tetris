import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/providers/local_data_source_provider.dart';
import 'package:tetris/data/repository/game_settings_repository.dart';

final gameSettingsRepositoryProvider = Provider<GameSettingsRepository>(
  (ref) => GameSettingsRepository(ref.watch(localDataSourceProvider)),
);

class MutedStateNotifier extends StateNotifier<bool> {
  final GameSettingsRepository _gameSettingsRepository;

  MutedStateNotifier(this._gameSettingsRepository) : super(false) {
    _init();
  }

  Future<void> toggle() async {
    await updateValue(!state);
  }

  Future<void> updateValue(bool value) async {
    _gameSettingsRepository.muted = value;
    state = value;
  }

  Future<void> _init() async {
    bool savedValue = await _gameSettingsRepository.muted;
    if (!mounted) return;
    if (savedValue != state) {
      state = savedValue;
    }
  }
}

class ColoredStateNotifier extends StateNotifier<bool> {
  final GameSettingsRepository _gameSettingsRepository;

  ColoredStateNotifier(this._gameSettingsRepository) : super(false) {
    _init();
  }

  Future<void> toggle() async {
    await updateValue(!state);
  }

  Future<void> updateValue(bool value) async {
    _gameSettingsRepository.colored = value;
    state = value;
  }

  Future<void> _init() async {
    bool savedValue = await _gameSettingsRepository.colored;
    if (!mounted) return;
    if (savedValue != state) {
      state = savedValue;
    }
  }
}

final mutedStateProvider =
    StateNotifierProvider.autoDispose<MutedStateNotifier, bool>(
      (ref) => MutedStateNotifier(ref.watch(gameSettingsRepositoryProvider)),
    );

final coloredStateProvider =
    StateNotifierProvider.autoDispose<ColoredStateNotifier, bool>(
      (ref) => ColoredStateNotifier(ref.watch(gameSettingsRepositoryProvider)),
    );

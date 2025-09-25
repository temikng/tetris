interface class IGameSettingsRepository {
  Future<bool> get muted => Future.value(false);

  set muted(bool value) {}

  Future<bool> get colored => Future.value(false);

  set colored(bool value) {}
}

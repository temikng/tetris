interface class IHighScoreRepository {
  Future<int> get highScore => Future.value(0);

  set highScore(int value) {}
}

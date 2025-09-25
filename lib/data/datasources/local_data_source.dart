abstract class LocalDataSource {
  Future<void> init();

  T getValue<T>(dynamic key, {T? defaultValue});

  Future<void> setValue<T>(dynamic key, T? value);

  Future<void> delete(dynamic key);
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tetris/data/datasources/local_data_source.dart';

class HiveLocalDataSource extends LocalDataSource {
  static const _box = 'kv';

  Box get _b => Hive.box(_box);

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_box);
  }

  @override
  T getValue<T>(dynamic key, {T? defaultValue}) => _b.get(key) ?? defaultValue;

  @override
  Future<void> setValue<T>(dynamic key, T? value) => _b.put(key, value);

  @override
  Future<void> delete(dynamic key) => _b.delete(key);
}

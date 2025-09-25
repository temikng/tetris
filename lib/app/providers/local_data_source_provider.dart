import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/data/datasources/hive_local_data_source.dart';
import 'package:tetris/data/datasources/local_data_source.dart';

final localDataSourceProvider = Provider<LocalDataSource>(
  (_) => HiveLocalDataSource(),
);

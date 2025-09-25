import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/providers/local_data_source_provider.dart';
import 'package:tetris/data/repository/high_score_repository.dart';

final highScoreRepositoryProvider = Provider<HighScoreRepository>(
  (ref) => HighScoreRepository(ref.watch(localDataSourceProvider)),
);

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/providers/local_data_source_provider.dart';
import 'package:tetris/app/providers/sounds_controller_provider.dart';

import 'app.dart';

Future<void> bootstrap() async {
  final providerContainer = ProviderContainer();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await providerContainer.read(localDataSourceProvider).init();
  await providerContainer.read(soundsControllerProvider).initialize();

  runApp(
    UncontrolledProviderScope(container: providerContainer, child: const App()),
  );
}

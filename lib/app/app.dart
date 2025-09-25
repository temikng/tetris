import 'package:flutter/material.dart';
import 'package:tetris/app/presentation/tetris_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetris',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffe8c81f),
          surface: Color(0xffe8c81f),
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const TetrisView(),
    );
  }
}

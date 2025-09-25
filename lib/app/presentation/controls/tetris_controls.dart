import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/controls/menu_controls.dart';
import 'package:tetris/app/presentation/controls/navigation_controls.dart';

class TetrisControls extends ConsumerStatefulWidget {
  const TetrisControls({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TetrisControlsState();
}

class _TetrisControlsState extends ConsumerState<TetrisControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [MenuControls(), NavigationControls()],
    );
  }
}

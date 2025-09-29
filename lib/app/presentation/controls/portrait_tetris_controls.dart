import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/controls/portrait_menu_controls.dart';
import 'package:tetris/app/presentation/controls/portrait_navigation_controls.dart';

class PortraitTetrisControls extends ConsumerStatefulWidget {
  const PortraitTetrisControls({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TetrisControlsState();
}

class _TetrisControlsState extends ConsumerState<PortraitTetrisControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [PortraitMenuControls(), PortraitNavigationControls()],
    );
  }
}

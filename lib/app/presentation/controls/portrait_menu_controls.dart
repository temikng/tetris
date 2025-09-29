import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/controls/menu_config_controls.dart';
import 'package:tetris/app/presentation/controls/menu_game_controls.dart';

class PortraitMenuControls extends ConsumerWidget {
  const PortraitMenuControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [MenuGameControls(), MenuConfigControls()],
    );
  }
}

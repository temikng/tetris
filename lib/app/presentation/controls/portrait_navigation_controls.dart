import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/controls/navigation_action_controls.dart';
import 'package:tetris/app/presentation/controls/navigation_move_controls.dart';

class PortraitNavigationControls extends ConsumerWidget {
  const PortraitNavigationControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [NavigationMoveControls(), NavigationActionControls()],
    );
  }
}

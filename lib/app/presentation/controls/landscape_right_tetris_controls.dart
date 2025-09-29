import 'package:flutter/material.dart';
import 'package:tetris/app/presentation/controls/menu_config_controls.dart';
import 'package:tetris/app/presentation/controls/navigation_action_controls.dart';

class LandscapeRightTetrisControls extends StatelessWidget {
  const LandscapeRightTetrisControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [MenuConfigControls(), NavigationActionControls()],
    );
  }
}

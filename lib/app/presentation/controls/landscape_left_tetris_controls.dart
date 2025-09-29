import 'package:flutter/material.dart';
import 'package:tetris/app/presentation/controls/menu_game_controls.dart';
import 'package:tetris/app/presentation/controls/navigation_move_controls.dart';
import 'package:tetris/const/fonts.dart';

class LandscapeLeftTetrisControls extends StatelessWidget {
  const LandscapeLeftTetrisControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuGameControls(),
        Text(
          "TETRIS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: mainFontFamily,
            fontSize: 18.0,
          ),
        ),
        NavigationMoveControls(),
      ],
    );
  }
}

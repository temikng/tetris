import 'package:flutter/material.dart';
import 'package:tetris/app/presentation/controls/portrait_tetris_controls.dart';
import 'package:tetris/app/presentation/display/tetris_display.dart';
import 'package:tetris/const/fonts.dart';

class TetrisPortraitView extends StatelessWidget {
  const TetrisPortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "TETRIS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: mainFontFamily,
            fontSize: 18.0,
          ),
        ),
        Expanded(child: TetrisDisplay()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: PortraitTetrisControls(),
        ),
      ],
    );
  }
}

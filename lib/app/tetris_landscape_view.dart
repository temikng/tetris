import 'package:flutter/material.dart';
import 'package:tetris/app/presentation/controls/landscape_left_tetris_controls.dart';
import 'package:tetris/app/presentation/controls/landscape_right_tetris_controls.dart';
import 'package:tetris/app/presentation/display/tetris_display.dart';

class TetrisLandscapeView extends StatefulWidget {
  const TetrisLandscapeView({super.key});

  @override
  State<TetrisLandscapeView> createState() => _TetrisLandscapeViewState();
}

class _TetrisLandscapeViewState extends State<TetrisLandscapeView> {
  double? _widthOfLandscapeSideControls;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: _widthOfLandscapeSideControls,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: LandscapeLeftTetrisControls(),
              ),
            ),
            Expanded(
              child: TetrisDisplay(
                onDisplaySizeChanged: (size) {
                  setState(() {
                    var screenWidth = constraints.maxWidth;
                    var diplayWidth = size.width;

                    _widthOfLandscapeSideControls =
                        (screenWidth - diplayWidth) / 2;
                  });
                },
              ),
            ),
            SizedBox(
              width: _widthOfLandscapeSideControls,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: LandscapeRightTetrisControls(),
              ),
            ),
          ],
        );
      },
    );
  }
}

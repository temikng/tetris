import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetris/app/presentation/utils/measure_size.dart';
import 'package:tetris/app/providers/game_provider.dart';
import 'package:tetris/app/providers/game_settings_provider.dart';
import 'package:tetris/const/fonts.dart';
import 'package:tetris/app/presentation/display/sound_state_view.dart';
import 'package:tetris/app/presentation/display/tetris_game_canvas.dart';
import 'package:tetris/app/presentation/display/tetris_next_figure_preview.dart';
import 'package:tetris/app/presentation/display/tetris_state_painter.dart';

class TetrisDisplay extends ConsumerStatefulWidget {
  final Function(Size)? onDisplaySizeChanged;

  const TetrisDisplay({super.key, this.onDisplaySizeChanged});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TetrisDisplayState();
}

class _TetrisDisplayState extends ConsumerState<TetrisDisplay> {
  Size? _rightPartOfDisplay;
  Size? _leftPartOfDisplay;
  Size? _displaySize;

  void _handleDisplaySizeChanged() {
    _displaySize = Size(
      _leftPartOfDisplay!.width + _rightPartOfDisplay!.width + 16,
      _leftPartOfDisplay!.height,
    );
    widget.onDisplaySizeChanged?.call(_displaySize!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _displaySize?.width ?? double.infinity,
      padding: EdgeInsets.all(8.0),
      color: Color(0xff9ba585),
      child: Row(
        children: [
          Expanded(
            child: ref
                .watch(gameStateDataProvider)
                .when(
                  data: (stateData) => TetrisGameCanvas(
                    gameParams: ref.watch(gameControllerProvider).gameParams,
                    gameStateData: stateData,
                    isColoredMode: ref.watch(coloredStateProvider),
                    hasBorder: true,
                    onCanvasSizeChanged: (size) {
                      _leftPartOfDisplay = size;
                      if (_rightPartOfDisplay != null) {
                        _handleDisplaySizeChanged();
                      }
                    },
                  ),
                  error: (_, _) => SizedBox.shrink(),
                  loading: () => CircularProgressIndicator(),
                ),
          ),
          MeasureSize(
            onChange: (size) {
              _rightPartOfDisplay = size;
              if (_leftPartOfDisplay != null) {
                _handleDisplaySizeChanged();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Score",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: mainFontFamily,
                        ),
                      ),
                      Text(
                        "${ref.watch(scoreProvider).value}",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: mainFontFamily,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Hi-Score",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: mainFontFamily,
                        ),
                      ),
                      Text(
                        "${ref.watch(highScoreProvider).value}",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: mainFontFamily,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: mainFontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                    child: ref
                        .watch(nextFigureProvider)
                        .when(
                          data: (nextFigure) => TetrisNextFigurePreview(
                            figure: nextFigure,
                            isColoredMode: ref.watch(coloredStateProvider),
                          ),
                          error: (_, _) => SizedBox.shrink(),
                          loading: () => CircularProgressIndicator(),
                        ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Level",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: mainFontFamily,
                    ),
                  ),
                  Text(
                    "${ref.watch(levelProvider).value}",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: mainFontFamily,
                    ),
                  ),

                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: SoundStateView(
                          enabled: !ref.watch(mutedStateProvider),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: CustomPaint(
                          painter: TetrisStatePainter(
                            ref.watch(gameStateProvider).value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tetris/app/presentation/const/tetris_colors.dart';

class SoundStateView extends StatelessWidget {
  static const colorFilter = ColorFilter.mode(
    filledBrickColor,
    BlendMode.srcIn,
  );
  final bool enabled;

  const SoundStateView({super.key, required this.enabled});

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return SvgPicture.asset(
        'assets/icons/sound_loud.svg',
        colorFilter: colorFilter,
      );
    } else {
      return SvgPicture.asset(
        'assets/icons/sound_off.svg',
        colorFilter: colorFilter,
      );
    }
  }
}

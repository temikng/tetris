import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const UiButton({
    super.key,
    required this.onPressed,
    this.color = const Color(0xff3c6be5),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shadowColor: Colors.black,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      child: SizedBox.shrink(),
    );
  }
}

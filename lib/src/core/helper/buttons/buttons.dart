import 'package:flutter/material.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.height = 41,
    this.width = double.infinity,
    this.disabled = false,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.height = 41,
    this.width = double.infinity,
    this.disabled = false,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;

  final double width;
  final double height;

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              child: Text(
                label,
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              child: Text(
                label,
              ),
            ),
    );
  }
}

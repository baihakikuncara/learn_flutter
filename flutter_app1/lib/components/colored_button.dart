import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  static const buttonWidth = 200.0;

  final String text;
  final Function() func;
  final bool secondary;

  const ColoredButton(this.text, this.func,
      {this.secondary = false, super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    Color foregroundColor, backgroundColor;
    if (secondary) {
      foregroundColor = colorScheme.onSecondary;
      backgroundColor = colorScheme.secondary;
    } else {
      foregroundColor = colorScheme.onPrimary;
      backgroundColor = colorScheme.primary;
    }

    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        onPressed: func,
        child: Text(text),
      ),
    );
  }
}

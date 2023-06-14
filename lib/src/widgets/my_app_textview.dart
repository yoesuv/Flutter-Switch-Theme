import 'package:flutter/material.dart';

class MyAppTextView extends StatelessWidget {
  const MyAppTextView(this.text, {super.key, this.style});

  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Text(
      text ?? '',
      style: style?.copyWith(
        color: brightness == Brightness.dark ? Colors.white : Colors.black,
      ),
    );
  }
}

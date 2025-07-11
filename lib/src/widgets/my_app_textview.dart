import 'package:flutter/material.dart';

/// A customizable text widget that adapts to the app's theme and supports common text properties.
class MyAppTextView extends StatelessWidget {
  const MyAppTextView(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.defaultText = '',
  });

  /// The text to display. If null, [defaultText] is used.
  final String? text;

  /// Custom text style to apply. Merges with the theme's default style if provided.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Optional semantics label for accessibility.
  final String? semanticsLabel;

  /// Text to display if [text] is null. Defaults to an empty string.
  final String defaultText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Use theme's onSurface color for better theme compatibility
    final defaultColor = isDarkMode ? Colors.white : Colors.black;

    // Merge provided style with theme's default text style
    final effectiveStyle =
        theme.textTheme.bodyMedium
            ?.merge(style)
            .copyWith(color: style?.color ?? defaultColor) ??
        TextStyle(color: defaultColor);

    return Text(
      text ?? defaultText,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      textScaler: MediaQuery.textScalerOf(
        context,
      ), // Respect user font size settings
    );
  }
}

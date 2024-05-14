import 'package:flutter/material.dart';

/// Extension for [BuildContext] to access [TextTheme] instance.
extension TextThemeX on BuildContext {
  /// Returns [TextTheme] instance.
  TextTheme get textTheme => Theme.of(this).textTheme;
}

/// Extension for [BuildContext] to access [ColorScheme] instance.
extension ColorSchemeX on BuildContext {
  /// Returns [ColorScheme] instance.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
